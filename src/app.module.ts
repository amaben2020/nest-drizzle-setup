// app.module.ts
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { DrizzleMySqlModule } from '@knaadh/nestjs-drizzle-mysql2';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import { database } from './database';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),

    // DEV DB
    DrizzleMySqlModule.registerAsync({
      tag: 'DB_DEV',
      inject: [ConfigService],
      // configService: ConfigService
      useFactory: () => ({
        mysql: {
          connection: 'client',
          config: {
            // host: config.get('DB_DEV_HOST'),
            host: 'localhost',
            // port: Number(config.get('DB_DEV_PORT')),
            port: 3307,
            // user: config.get('DB_DEV_USER'),
            user: 'root',
            // password: config.get('DB_DEV_PASS'),
            password: 'algomachine',
            // database: config.get('DB_DEV_NAME'),
            database: 'db_local',
          },
        },
        config: { ...database, mode: 'default' },
      }),
    }),

    // PROD DB
    // DrizzleMySqlModule.registerAsync({
    //   tag: 'DB_PROD',
    //   inject: [ConfigService],
    //   useFactory: (config: ConfigService) => ({
    //     mysql: {
    //       connection: 'client',
    //       config: {
    //         host: config.get('DB_PROD_HOST'),
    //         port: Number(config.get('DB_PROD_PORT')),
    //         user: config.get('DB_PROD_USER'),
    //         password: config.get('DB_PROD_PASS'),
    //         database: config.get('DB_PROD_NAME'),
    //       },
    //     },
    //     config: { schema: { ...schema }, mode: 'default' },
    //   }),
    // }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
