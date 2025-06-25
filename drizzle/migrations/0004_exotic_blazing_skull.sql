DROP TABLE `usersTest`;--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `is_new` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `is_new` tinyint NOT NULL;