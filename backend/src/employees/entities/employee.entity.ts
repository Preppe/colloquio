import { Activity } from 'src/activities/entities/activity.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Employee {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  name: string;

  @OneToMany(() => Activity, (activity) => activity.employee)
  activities: Activity[];
}
