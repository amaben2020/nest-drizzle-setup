DROP TABLE `bus_pay_trans`;--> statement-breakpoint
RENAME TABLE `bus_airtime_trans` TO `business_payment_transactions`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` RENAME COLUMN `provider` TO `narration`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` RENAME COLUMN `receiver` TO `order_reference`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` RENAME COLUMN `payment_reference` TO `receiver_name`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` RENAME COLUMN `phone` TO `sender_name`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` RENAME COLUMN `vend_request_body` TO `receiver_wallet`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` RENAME COLUMN `vend_response_body` TO `client_used`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `bus_airtime_trans_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `bus_airtime_trans_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `bus_airtime_trans_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_branches` DROP FOREIGN KEY `business_branches_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_pins` DROP FOREIGN KEY `business_pins_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_power_transactions` DROP FOREIGN KEY `business_power_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_power_transactions` DROP FOREIGN KEY `business_power_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_power_transactions` DROP FOREIGN KEY `business_power_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_profiles` DROP FOREIGN KEY `business_profiles_b_user_id_business_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_recovery_infos` DROP FOREIGN KEY `business_recovery_infos_user_id_business_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_settlement_accounts` DROP FOREIGN KEY `business_settlement_accounts_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_shareholders` DROP FOREIGN KEY `business_shareholders_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_tv_transactions` DROP FOREIGN KEY `business_tv_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_tv_transactions` DROP FOREIGN KEY `business_tv_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_tv_transactions` DROP FOREIGN KEY `business_tv_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_wallet_accounts` DROP FOREIGN KEY `business_wallet_accounts_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_wallet_accounts` DROP FOREIGN KEY `business_wallet_accounts_wallet_id_business_wallets_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_wallet_snapshots` DROP FOREIGN KEY `business_wallet_snapshots_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_wallets` DROP FOREIGN KEY `business_wallets_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `dashme_transactions` DROP FOREIGN KEY `dashme_transactions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `data_transactions` DROP FOREIGN KEY `data_transactions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `deleted_accounts` DROP FOREIGN KEY `deleted_accounts_reason_id_reasons_id_fk`;
--> statement-breakpoint
ALTER TABLE `kycs` DROP FOREIGN KEY `kycs_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `kycs` DROP FOREIGN KEY `kycs_document_type_id_document_types_id_fk`;
--> statement-breakpoint
ALTER TABLE `notifications` DROP FOREIGN KEY `notifications_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `otps` DROP FOREIGN KEY `otps_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `pins` DROP FOREIGN KEY `pins_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `power_transactions` DROP FOREIGN KEY `power_transactions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `recovery_infos` DROP FOREIGN KEY `recovery_infos_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `report_preferences` DROP FOREIGN KEY `report_preferences_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `security_questions` DROP FOREIGN KEY `security_questions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `staff_profiles` DROP FOREIGN KEY `staff_profiles_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `staff_profiles` DROP FOREIGN KEY `staff_profiles_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `transactions` DROP FOREIGN KEY `transactions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `tv_transactions` DROP FOREIGN KEY `tv_transactions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `user_accounts` DROP FOREIGN KEY `user_accounts_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `user_card_details` DROP FOREIGN KEY `user_card_details_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `user_tokens` DROP FOREIGN KEY `user_tokens_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `wallet_accounts` DROP FOREIGN KEY `wallet_accounts_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `wallet_accounts` DROP FOREIGN KEY `wallet_accounts_wallet_id_wallets_id_fk`;
--> statement-breakpoint
ALTER TABLE `wallets` DROP FOREIGN KEY `wallets_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `accessibilities` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `adept_access` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `airtime_providers` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `airtime_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `airtime_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `app_settings` MODIFY COLUMN `createdAt` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `banks` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `beneficiaries` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `bill_mates_favourites` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `bill_mates_favourites` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `blue_admin_roles` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `blue_admins` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `blue_admins` MODIFY COLUMN `updated_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `narration` varchar(255);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `order_reference` varchar(50);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `amount` decimal(15,2);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `receiver_name` varchar(250);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `payment_mode` enum('blue-user','phone','offline','withdrawal','wallet_topup','card','bank_transfer') NOT NULL;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `sender_name` varchar(200);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `status` enum('in-progress','pending','successful','failed','reversed') NOT NULL DEFAULT 'pending';--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `receiver_wallet` varchar(20);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `created_at` datetime NOT NULL;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `client_used` enum('desktop','mobile') DEFAULT 'mobile';--> statement-breakpoint
ALTER TABLE `business_branches` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_branches` MODIFY COLUMN `is_active` tinyint NOT NULL DEFAULT 1;--> statement-breakpoint
ALTER TABLE `business_data_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_data_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_devices` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_onboarding_forms` MODIFY COLUMN `accepts_digital_payments` tinyint NOT NULL;--> statement-breakpoint
ALTER TABLE `business_onboarding_forms` MODIFY COLUMN `accepts_digital_payments` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `business_pins` MODIFY COLUMN `created_at` datetime(6) NOT NULL DEFAULT (now(6));--> statement-breakpoint
ALTER TABLE `business_pins` MODIFY COLUMN `updated_at` datetime(6) NOT NULL DEFAULT (now(6));--> statement-breakpoint
ALTER TABLE `business_power_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_power_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_profiles` MODIFY COLUMN `created_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_profiles` MODIFY COLUMN `updated_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_recovery_infos` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_security_questions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_settlement_accounts` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_shareholders` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_transaction_histories` MODIFY COLUMN `created_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_tv_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_tv_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_users` MODIFY COLUMN `flagged` tinyint NOT NULL;--> statement-breakpoint
ALTER TABLE `business_users` MODIFY COLUMN `flagged` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `business_users` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_wallet_accounts` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_wallet_snapshots` MODIFY COLUMN `created_at` datetime(6) NOT NULL DEFAULT (now(6));--> statement-breakpoint
ALTER TABLE `business_wallet_snapshots` MODIFY COLUMN `updated_at` datetime(6) NOT NULL DEFAULT (now(6));--> statement-breakpoint
ALTER TABLE `business_wallets` MODIFY COLUMN `created_at` datetime(6) NOT NULL DEFAULT (now(6));--> statement-breakpoint
ALTER TABLE `business_wallets` MODIFY COLUMN `updated_at` datetime(6) NOT NULL DEFAULT (now(6));--> statement-breakpoint
ALTER TABLE `dashme_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `data_packages` MODIFY COLUMN `created_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `data_providers` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `data_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `data_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `deleted_accounts` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `flagged_users` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `irchg_banks` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `irecharge_data_packages` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `irecharge_power_providers` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `irecharge_tv_packages` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `kycs` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `otps` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `api_response` text;--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `request_body` text;--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `response_body` text;--> statement-breakpoint
ALTER TABLE `paystack_banks` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `pilot_testers` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `pins` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `power_providers` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `power_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `power_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `recovery_infos` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `report_preferences` MODIFY COLUMN `is_active` tinyint NOT NULL DEFAULT 1;--> statement-breakpoint
ALTER TABLE `security_questions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `sms_logs` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `staff_profiles` MODIFY COLUMN `is_active` tinyint NOT NULL DEFAULT 1;--> statement-breakpoint
ALTER TABLE `staff_profiles` MODIFY COLUMN `created_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `staff_profiles` MODIFY COLUMN `updated_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `staff_roles` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `temp_accounts` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `temp_recovery_phones` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `tv_packages` MODIFY COLUMN `created_at` datetime NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `tv_providers` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `tv_transactions` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `tv_transactions` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `user_accounts` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `user_card_details` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `user_card_details` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `user_tokens` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `flagged` tinyint NOT NULL;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `flagged` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_best_friend` tinyint;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_best_friend` tinyint DEFAULT 0;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_new` int;--> statement-breakpoint
ALTER TABLE `ussd_withdrawals` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `ussd_withdrawals` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `wallet_accounts` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `is_new` tinyint NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE `wallet_snapshots` MODIFY COLUMN `is_new` tinyint NOT NULL;--> statement-breakpoint
ALTER TABLE `wallets` MODIFY COLUMN `updated_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `withdraw_credentials` MODIFY COLUMN `created_at` datetime DEFAULT (now());--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `business_data_transactions` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `due_date` datetime;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `verification_request` varchar(1000);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `verification_response` varchar(1000);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `service_charge` decimal(10,2) DEFAULT '0.00';--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `email` varchar(300);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `request_body` varchar(1000);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `response_body` varchar(1000);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `receiver_type` enum('personal','business','business-personal');--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD `sent_by` varchar(20);--> statement-breakpoint
ALTER TABLE `usersTest` ADD `is_old` int;