import { mysqlTable, int, varchar } from 'drizzle-orm/mysql-core';

export const usersTest = mysqlTable('usersTest', {
  id: int('id').primaryKey().autoincrement(),
  email: varchar('email', { length: 255 }),
});
