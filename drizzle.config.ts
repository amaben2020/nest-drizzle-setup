import * as dotenv from 'dotenv';

const ENV = process.env.NODE_ENV ?? 'development';
dotenv.config({ path: `.env.${ENV}` }); // 🔥 This ensures the correct env file is loaded

export default {
  schema: './src/database/schema.ts',
  out: './drizzle/migrations',
  dialect: 'mysql',
  dbCredentials: {
    host: process.env.DB_HOST!,
    port: Number(process.env.DB_PORT),
    user: process.env.DB_USERNAME!,
    password: process.env.DB_PASSWORD!,
    database: process.env.DB_DATABASE!,
  },
};
