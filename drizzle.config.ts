import * as dotenv from 'dotenv';
dotenv.config();

console.log('process.env.DB_DEV_HOST', process.env.DB_DEV_HOST);

export default {
  schema: './src/db/schema.ts',
  out: './drizzle/migrations',
  driver: 'mysql2',
  dbCredentials: {
    host: 'localhost',
    port: 3307,
    user: 'root',
    password: 'algomachine',
    database: 'db_local',
  },
};
