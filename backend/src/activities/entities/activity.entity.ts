import { Employee } from "src/employees/entities/employee.entity";
import { Project } from "src/projects/entities/project.entity";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Activity {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    hours: number;

    @Column()
    date: Date;

    @ManyToOne(() => Project, project => project.activities)
    project: Project;

    @ManyToOne(() => Employee, employee => employee.activities)
    employee: Employee;
}