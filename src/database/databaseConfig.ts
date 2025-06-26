import { registerAs } from '@nestjs/config';

const databaseConfig = registerAs('database', () => ({
  host: process.env.DB_HOST,
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  name: process.env.DB_NAME,
  database: process.env.DB_DATABASE,
  port: parseInt(process.env.DB_PORT!),
}));

export default databaseConfig;
