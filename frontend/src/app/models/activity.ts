import { Employee } from "./employee";
import { Project } from "./project";

export interface Activity {
    id: string;
    hours: number;
    date: string;
    project: Project;
    employee: Employee;
}