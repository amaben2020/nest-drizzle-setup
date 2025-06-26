// app.module.ts
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { DrizzleMySqlModule } from '@knaadh/nestjs-drizzle-mysql2';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import { database } from './database';
import appConfig from './appConfig';
import databaseConfig from './database/databaseConfig';
import { environmentValidation } from 'environment.config';

const ENV = process.env.NODE_ENV ?? 'development';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: ENV ? `.env.${ENV}` : '.env',
      load: [appConfig, databaseConfig],
      validationSchema: ENV === 'test' ? undefined : environmentValidation,
    }),

    // DEV DB
    DrizzleMySqlModule.registerAsync({
      tag: 'DB_DEV',
      inject: [ConfigService],

      useFactory: (config: ConfigService) => ({
        mysql: {
          connection: 'client',
          config: {
            host: config.get('DB_HOST'), //propertyPath must match the key in .env
            port: Number(config.get('DB_PORT')),
            user: config.get('DB_USERNAME'),
            password: config.get('DB_PASSWORD'),
            database: config.get('DB_DATABASE'),
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
