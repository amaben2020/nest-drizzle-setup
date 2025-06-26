import * as dotenv from 'dotenv';
dotenv.config();

export default {
  schema: './src/database/schema.ts',
  out: './drizzle/migrations',
  dialect: 'mysql',
  dbCredentials: {
    host: process.env.DB_HOST || 'localhost',
    port: Number(process.env.DB_PORT) || 3307,
    user: process.env.DB_USERNAME || 'root',
    password: process.env.DB_PASSWORD || 'algomachine',
    database: process.env.DB_DATABASE || 'blue_dev',
  },
};
