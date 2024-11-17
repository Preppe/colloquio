import { ActivityTable } from "./component/activitie/table";
import { Activity } from "./models/activity";

export default async function Home() {
  const activities: Activity[] = await fetch("http://localhost:3000/activities").then((res) => res.json());

  return (
    <>
      <ActivityTable activities={activities} />
    </>
  );
}
