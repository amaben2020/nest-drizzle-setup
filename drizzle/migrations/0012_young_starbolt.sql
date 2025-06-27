CREATE TABLE `business_airtime_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`branch_id` bigint unsigned,
	`staff_id` bigint unsigned,
	`provider` varchar(15) NOT NULL,
	`receiver` varchar(15) NOT NULL,
	`amount` decimal(12,2),
	`payment_reference` varchar(40),
	`payment_mode` enum('wallet','card'),
	`phone` varchar(15),
	`transaction_id` varchar(30) NOT NULL,
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`vend_request_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`vend_response_body` varchar(1500),
	CONSTRAINT `business_airtime_transactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `api_response` varchar(1500);--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `request_body` varchar(10000);--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `response_body` varchar(10000);--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_best_friend` tinyint;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_best_friend` tinyint DEFAULT 0;--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `is_new` tinyint DEFAULT 1;--> statement-breakpoint
ALTER TABLE `business_onboarding_forms` ADD CONSTRAINT `id` UNIQUE(`id`);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `unique_bus_transaction` UNIQUE(`transaction_id`,`business_id`);--> statement-breakpoint
ALTER TABLE `business_airtime_transactions` ADD CONSTRAINT `business_airtime_transactions_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_airtime_transactions` ADD CONSTRAINT `business_airtime_transactions_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_airtime_transactions` ADD CONSTRAINT `business_airtime_transactions_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_branches` ADD CONSTRAINT `business_branches_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_data_transactions` ADD CONSTRAINT `business_data_transactions_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_data_transactions` ADD CONSTRAINT `business_data_transactions_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_data_transactions` ADD CONSTRAINT `business_data_transactions_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `business_payment_transactions_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `business_payment_transactions_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `business_payment_transactions_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_pins` ADD CONSTRAINT `business_pins_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_power_transactions` ADD CONSTRAINT `business_power_transactions_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_power_transactions` ADD CONSTRAINT `business_power_transactions_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_power_transactions` ADD CONSTRAINT `business_power_transactions_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_profiles` ADD CONSTRAINT `business_profiles_b_user_id_business_users_id_fk` FOREIGN KEY (`b_user_id`) REFERENCES `business_users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_recovery_infos` ADD CONSTRAINT `business_recovery_infos_user_id_business_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `business_users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_settlement_accounts` ADD CONSTRAINT `business_settlement_accounts_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_shareholders` ADD CONSTRAINT `business_shareholders_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_tv_transactions` ADD CONSTRAINT `business_tv_transactions_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_tv_transactions` ADD CONSTRAINT `business_tv_transactions_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_tv_transactions` ADD CONSTRAINT `business_tv_transactions_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_wallet_accounts` ADD CONSTRAINT `business_wallet_accounts_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_wallet_accounts` ADD CONSTRAINT `business_wallet_accounts_wallet_id_business_wallets_id_fk` FOREIGN KEY (`wallet_id`) REFERENCES `business_wallets`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_wallet_snapshots` ADD CONSTRAINT `business_wallet_snapshots_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_wallets` ADD CONSTRAINT `business_wallets_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `dashme_transactions` ADD CONSTRAINT `dashme_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `data_transactions` ADD CONSTRAINT `data_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `deleted_accounts` ADD CONSTRAINT `deleted_accounts_reason_id_reasons_id_fk` FOREIGN KEY (`reason_id`) REFERENCES `reasons`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `kycs` ADD CONSTRAINT `kycs_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `kycs` ADD CONSTRAINT `kycs_document_type_id_document_types_id_fk` FOREIGN KEY (`document_type_id`) REFERENCES `document_types`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `otps` ADD CONSTRAINT `otps_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `pins` ADD CONSTRAINT `pins_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `power_transactions` ADD CONSTRAINT `power_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `recovery_infos` ADD CONSTRAINT `recovery_infos_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `report_preferences` ADD CONSTRAINT `report_preferences_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `security_questions` ADD CONSTRAINT `security_questions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `staff_profiles` ADD CONSTRAINT `staff_profiles_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `staff_profiles` ADD CONSTRAINT `staff_profiles_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `tv_transactions` ADD CONSTRAINT `tv_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_accounts` ADD CONSTRAINT `user_accounts_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_card_details` ADD CONSTRAINT `user_card_details_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_tokens` ADD CONSTRAINT `user_tokens_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `wallet_accounts` ADD CONSTRAINT `wallet_accounts_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `wallet_accounts` ADD CONSTRAINT `wallet_accounts_wallet_id_wallets_id_fk` FOREIGN KEY (`wallet_id`) REFERENCES `wallets`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `wallets` ADD CONSTRAINT `wallets_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;