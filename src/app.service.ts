import { usersTest } from './database/usersTest.entity';
// app.service.ts
import { Injectable, Inject } from '@nestjs/common';
import { MySql2Database } from 'drizzle-orm/mysql2';
import * as schema from './database/schema';

@Injectable()
export class AppService {
  constructor(
    @Inject('DB_DEV') private devDb: MySql2Database<typeof schema>,
    // @Inject('DB_PROD') private prodDb: MySql2Database<typeof schema>,
  ) {}

  async getUsers() {
    return this.devDb.select().from(usersTest);
  }
}
