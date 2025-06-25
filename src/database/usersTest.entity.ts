import { mysqlTable, int, varchar } from 'drizzle-orm/mysql-core';

// having them separated makes it easier to test the db connection and queries
// we could do an import here
export const usersTest = mysqlTable('usersTest', {
  id: int('id').primaryKey().autoincrement(),
  email: varchar('email', { length: 255 }),
});
