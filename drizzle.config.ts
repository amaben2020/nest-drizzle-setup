import * as dotenv from 'dotenv';
dotenv.config();

export default {
  schema: './src/database/schema.ts',
  out: './drizzle/migrations',
  dialect: 'mysql', // ✅ valid dialect
  dbCredentials: {
    host: process.env.DB_DEV_HOST || 'localhost',
    port: Number(process.env.DB_DEV_PORT || '3307'),
    user: process.env.DB_DEV_USER || 'root',
    password: process.env.DB_DEV_PASS || 'algomachine',
    database: process.env.DB_DEV_NAME || 'db_local',
  },
};
