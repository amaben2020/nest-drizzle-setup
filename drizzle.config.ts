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
import * as path from 'path';

// Determine environment (default to development)
const ENV = process.env.NODE_ENV ?? 'development';
const envFile = path.resolve(process.cwd(), `.env.${ENV}`);

// Prefer `.env.{ENV}` if it exists; fallback to `.env`
if (fs.existsSync(envFile)) {
  dotenv.config({ path: envFile });
  console.log(`✅ Loaded ${envFile}`);
} else {
  dotenv.config(); // fallback to default .env
  console.log(`⚠️  ${envFile} not found. Loaded fallback .env`);
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

  // schema: './src/database/schema.ts',
  // out: './drizzle/migrations',
  // dialect: 'mysql',
  // dbCredentials: {
  //   // host: process.env.DB_HOST!,
  //   host: 'xefi550t7t6tjn36.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
  //   // port: Number(process.env.DB_PORT),
  //   port: 3306,
  //   //
  //   // user: process.env.DB_USERNAME!,
  //   user: 'upzul40u72ztzxld',
  //   //
  //   // password: process.env.DB_PASSWORD!,
  //   password: 'gvvasc1hc8gqbb9y',
  //   // database: process.env.DB_DATABASE!,
  //   database: 'h78c90bd0sv0eh6n',
  // },
};

// figure out how to make this work in ghactioins
