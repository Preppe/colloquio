import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ActivitiesModule } from './activities/activities.module';
import { EmployeesModule } from './employees/employees.module';
import { ProjectsModule } from './projects/projects.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'colloquio',
      password: 'colloquio',
      database: 'colloquio',
      synchronize: true,
      entities: ['dist/**/*.entity.js'],
    }),
    ProjectsModule,
    EmployeesModule,
    ActivitiesModule,
  ],
})
export class AppModule {}
