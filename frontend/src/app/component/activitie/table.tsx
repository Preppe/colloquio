"use client";
import { Activity } from "@/app/models/activity";
import { useEffect, useState } from "react";
import Chip from "../ui/chip";

export type DataRow = {
  project: string;
  employee: string;
  date: string;
  hours: number;
};

type GroupedRow = Record<string, string | number>;

// Funzione generica per raggruppare i dati
const groupByKeys = (data: DataRow[], keys: string[]) => {
  if (!keys.length) {
    return data;
  }
  const ret = Object.values(
    data.reduce((acc, row) => {
      // Genera una chiave unica in base alle chiavi specificate
      const key = keys.map((k) => row[k as keyof DataRow]).join("-");

      if (!acc[key]) {
        // Inizializza il gruppo con le chiavi specificate e una somma delle ore
        acc[key] = keys.reduce((group, k) => ({ ...group, [k]: row[k as keyof DataRow] }), { hours: 0 });
      }

      // Incrementa le ore per il gruppo
      (acc[key].hours as number) += row.hours;
      return acc;
    }, {} as Record<string, GroupedRow>)
  );

  // inserisco hours come ultimo elemento
  return ret.map((group) => {
    const { hours, ...rest } = group;
    return { ...rest, hours };
  });
};

export function ActivityTable({ activities }: { activities: Activity[] }) {
  const [groups, setGroups] = useState<(keyof DataRow)[]>(['project', 'employee']);
  const [groupedActivities, setGroupedActivities] = useState<GroupedRow[]>([]);

  const handleChangeGroups = (group: keyof DataRow) => {
    if (groups.includes(group)) {
      setGroups(groups.filter((g) => g !== group));
    } else {
      setGroups([...groups, group]);
    }
  }

  useEffect(() => {
    const dataRows: DataRow[] = activities.map((activity) => ({
      project: activity.project.id,
      employee: activity.employee.id,
      date: activity.date,
      hours: activity.hours,
    }));
    setGroupedActivities(groupByKeys(dataRows, groups));
  }, [activities, groups]);

  return (
    <>
      <Chip isActive={groups.includes("project")} text="project" handleChangeGroups={handleChangeGroups} />
      <Chip isActive={groups.includes("employee")} text="employee" handleChangeGroups={handleChangeGroups} />
      <div className="relative overflow-x-auto">
        <table className="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
          <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              {Object.keys(groupedActivities[0] || {}).map((key) => (
                <th key={key} scope="col" className="px-6 py-3">
                  {key}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {groupedActivities.map((group, index) => (
              <tr key={index}>
               {/* ciclo sul gruppo aggiungengo l eccezione per project e employee che lo mappo con il nome */}
                {Object.entries(group).map(([key, value]) => (
                  <td key={key} className="px-6 py-4">
                    {key === "project" || key === "employee" ? activities.find((a) => a[key].id === value)?.[key].name : value}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </>
  );
}
