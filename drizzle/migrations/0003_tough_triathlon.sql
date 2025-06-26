ALTER TABLE `business_branches` DROP FOREIGN KEY `business_branches_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
DROP INDEX `fk_data_branch_id` ON `business_data_transactions`;--> statement-breakpoint
DROP INDEX `fk_data_business_id` ON `business_data_transactions`;--> statement-breakpoint
DROP INDEX `fk_data_staff_id` ON `business_data_transactions`;--> statement-breakpoint
DROP INDEX `fk_payment_branch_id` ON `business_payment_transactions`;--> statement-breakpoint
DROP INDEX `fk_payment_business_id` ON `business_payment_transactions`;--> statement-breakpoint
DROP INDEX `fk_payment_staff_id` ON `business_payment_transactions`;--> statement-breakpoint
DROP INDEX `fk_power_branch_id` ON `business_power_transactions`;--> statement-breakpoint
DROP INDEX `fk_power_business_id` ON `business_power_transactions`;--> statement-breakpoint
DROP INDEX `fk_power_staff_id` ON `business_power_transactions`;--> statement-breakpoint
DROP INDEX `fk_b_user_id` ON `business_profiles`;--> statement-breakpoint
DROP INDEX `fk_tv_branch_id` ON `business_tv_transactions`;--> statement-breakpoint
DROP INDEX `fk_tv_business_id` ON `business_tv_transactions`;--> statement-breakpoint
DROP INDEX `fk_tv_staff_id` ON `business_tv_transactions`;--> statement-breakpoint
DROP INDEX `fk_walletsnapshot_history_business_id` ON `business_wallet_snapshots`;--> statement-breakpoint
DROP INDEX `FK_report_preferences_business_id` ON `report_preferences`;--> statement-breakpoint
DROP INDEX `staff_profiles_branch_fk` ON `staff_profiles`;--> statement-breakpoint
DROP INDEX `staff_profiles_business_id_fk` ON `staff_profiles`;--> statement-breakpoint
ALTER TABLE `accessibilities` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `adept_access` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `airtime_providers` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `airtime_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `airtime_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `app_settings` MODIFY COLUMN `createdAt` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `banks` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `beneficiaries` MODIFY COLUMN `updated_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `bill_mates_favourites` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `bill_mates_favourites` MODIFY COLUMN `updated_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `blue_admin_roles` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `blue_admins` MODIFY COLUMN `created_at` datetime DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `blue_admins` MODIFY COLUMN `updated_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `business_onboarding_forms` MODIFY COLUMN `accepts_digital_payments` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `business_users` MODIFY COLUMN `flagged` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `flagged` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `is_new` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `usersTest` ADD `nickname` varchar(255);--> statement-breakpoint
ALTER TABLE `airtime_transactions` ADD CONSTRAINT `airtime_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bill_mates_favourites` ADD CONSTRAINT `bill_mates_favourites_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `airtime_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_receiver` ON `airtime_transactions` (`receiver`);--> statement-breakpoint
CREATE INDEX `beneficiary_id` ON `beneficiaries` (`beneficiary_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `beneficiaries` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_business_id` ON `beneficiaries` (`business_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `bill_mates_favourites` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `bill_mates_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_transaction_reference` ON `bill_mates_transactions` (`transaction_reference`);--> statement-breakpoint
CREATE INDEX `idx_type` ON `bill_mates_transactions` (`type`);--> statement-breakpoint
CREATE INDEX `idx_created_at` ON `bill_mates_transactions` (`created_at`);--> statement-breakpoint
CREATE INDEX `idx_status` ON `bill_mates_transactions` (`status`);