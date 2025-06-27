// import * as dotenv from 'dotenv';

// const ENV = process.env.NODE_ENV ?? 'development';
// dotenv.config({ path: `.env.${ENV}` }); // 🔥 This ensures the correct env file is loaded

// export default {
//   schema: './src/database/schema.ts',
//   out: './drizzle/migrations',
//   dialect: 'mysql',
//   dbCredentials: {
//     host: process.env.DB_HOST!,
//     port: Number(process.env.DB_PORT),
//     user: process.env.DB_USERNAME!,
//     password: process.env.DB_PASSWORD!,
//     database: process.env.DB_DATABASE!,
//   },
// };

// import * as fs from 'fs';
// import * as dotenv from 'dotenv';

// const ENV = process.env.NODE_ENV ?? 'development';
// const envFile = `.env.${ENV}`;

// // Try to load .env.{ENV}, else fallback to .env (for GitHub Actions)
// // if (fs.existsSync(envFile)) {
// //   dotenv.config({ path: envFile });
// //   console.log(`✅ Loaded ${envFile}`);
// // } else {
// //   dotenv.config();
// //   console.log(`⚠️  ${envFile} not found, loaded default .env instead`);
// // }

// export default {
//   schema: './src/database/schema.ts',
//   out: './drizzle/migrations',
//   dialect: 'mysql',
//   dbCredentials: {
//     host: 'd1kb8x1fu8rhcnej.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
//     port: 3306,
//     user: 'oyd3i2rs2yb26lic',
//     password: 'mpnfrleo095gheeb',
//     database: 'wz12oseoex68yd4p',
//   },
// };
// console.log('Updated');

import * as fs from 'fs';
import * as dotenv from 'dotenv';

const ENV = process.env.NODE_ENV ?? 'development';
const envFile = `.env.${ENV}`;

if (fs.existsSync(envFile)) {
  dotenv.config({ path: envFile });
  console.log(`✅ Loaded ${envFile}`);
} else {
  dotenv.config(); // fallback to .env
  console.log(`⚠️  ${envFile} not found, loaded default .env`);
}

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
