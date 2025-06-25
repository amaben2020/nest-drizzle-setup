CREATE TABLE `accessibilities` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`access_daemon` varchar(1000),
	`ref_daemon` varchar(1000) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `accessibilities_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adept_access` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`access_token` varchar(1000),
	`ttl` datetime NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `adept_access_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `airtime_providers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(20) NOT NULL,
	`slug` varchar(20) NOT NULL,
	`image` varchar(200) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `airtime_providers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `airtime_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`provider` varchar(80) NOT NULL,
	`receiver` varchar(25) NOT NULL,
	`amount` decimal(12,2) unsigned,
	`payment_reference` varchar(40),
	`payment_mode` enum('wallet','card'),
	`phone` varchar(15),
	`transaction_id` varchar(30) NOT NULL,
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`vend_request_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`vend_response_body` varchar(1500),
	`balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
	`balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
	CONSTRAINT `airtime_transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `unq_airtime_txn` UNIQUE(`transaction_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `app_settings` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`sms_platform` enum('termii','sendchamp') NOT NULL,
	`verification_platform` enum('dojah','mono') NOT NULL DEFAULT 'dojah',
	`payment_platform` enum('flutterwave','paystack','irecharge') NOT NULL,
	`minimum_amount` decimal(8,0),
	`irchg_token_ttl` datetime,
	`irchg_charge_rate` decimal(5,0) NOT NULL DEFAULT '50',
	`irchg_token_login` varchar(60),
	`minimum_amount_to_phone` decimal(8,2) NOT NULL DEFAULT '200.00',
	`withdrawal_charge_rate` decimal(8,0) NOT NULL DEFAULT '20',
	`createdAt` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`no_kyc_max_amount` decimal(8,2) NOT NULL DEFAULT '20000.00',
	`basic_transfer_amount` decimal(10,2) NOT NULL DEFAULT '20000.00',
	`intermediate_transfer_amount` decimal NOT NULL DEFAULT '5000000',
	`min_amount_to_phone` decimal(10,2) NOT NULL DEFAULT '200.00',
	`min_amount_to_wallet` decimal(10,2) NOT NULL DEFAULT '100.00',
	`non_blue_charge_rate` decimal(10,2) NOT NULL DEFAULT '50.00',
	`blue_charge_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
	`min_withdrawal_amount` varchar(255),
	`adept_token` varchar(1000),
	`adept_token_ttl` datetime,
	`power_platform` enum('irecharge','vtpass','buypower') NOT NULL,
	`airtime_platform` enum('irecharge','vtpass','buypower') NOT NULL,
	`data_platform` enum('irecharge','vtpass','buypower') NOT NULL,
	`tv_platform` enum('irecharge','vtpass','buypower') NOT NULL,
	CONSTRAINT `app_settings_id` PRIMARY KEY(`id`),
	CONSTRAINT `UQ_4800b266ba790931744b3e53a74` UNIQUE(`id`)
);
--> statement-breakpoint
CREATE TABLE `banks` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`code` varchar(20) NOT NULL,
	`bank_code` varchar(20),
	`name` varchar(150) NOT NULL,
	`logo_url` varchar(100),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `banks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `beneficiaries` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`beneficiary_id` bigint unsigned,
	`identifier` varchar(50) NOT NULL,
	`type` enum('phone','blue-user') NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`business_beneficiary` bigint,
	`name` varchar(255),
	`business_id` bigint unsigned,
	CONSTRAINT `beneficiaries_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `bill_mates_favourites` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`provider_id` bigint unsigned,
	`provider_type` enum('power_providers','data_providers','tv_providers','airtime_providers') NOT NULL,
	`receiver` varchar(150) NOT NULL,
	`name` varchar(255) NOT NULL,
	`slug` varchar(255),
	`state` varchar(255),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`meter_category` varchar(100),
	CONSTRAINT `bill_mates_favourites_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `bill_mates_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`amount` decimal(15,2) unsigned NOT NULL,
	`status` enum('successful','pending','failed','in-progress','processing') NOT NULL,
	`type` enum('airtime','data','cable-tv','power') NOT NULL,
	`provider` varchar(255),
	`package` varchar(255),
	`transaction_reference` varchar(20),
	`created_at` datetime NOT NULL,
	`receiver` varchar(25),
	CONSTRAINT `bill_mates_transactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `blue_admin_roles` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `blue_admin_roles_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `blue_admins` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`email` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`display_picture` varchar(255),
	`password_changed_at` varchar(30),
	`role` varchar(20) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `blue_admins_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
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
CREATE TABLE `business_branches` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`name` varchar(150),
	`staff_size` varchar(20),
	`location` varchar(255),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`is_active` tinyint NOT NULL DEFAULT 1,
	CONSTRAINT `business_branches_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_categories` (
	`id` int NOT NULL,
	`title` varchar(200) NOT NULL,
	CONSTRAINT `business_categories_id` PRIMARY KEY(`id`),
	CONSTRAINT `UQ_d10a707dfd0ca189233999204e5` UNIQUE(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_data_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`branch_id` bigint unsigned,
	`staff_id` bigint unsigned,
	`receiver` varchar(20) NOT NULL,
	`provider` varchar(15) NOT NULL,
	`package` varchar(100) NOT NULL,
	`amount` decimal(12,2),
	`payment_reference` varchar(40),
	`customer_info` varchar(100),
	`customer_name` varchar(100),
	`payment_mode` enum('wallet','card'),
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`transaction_id` varchar(30) NOT NULL,
	`phone` varchar(15),
	`provider_slug` varchar(30),
	`access_token` varchar(40),
	`vend_request_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`code` varchar(10),
	`vend_response_body` varchar(1500),
	CONSTRAINT `business_data_transactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_devices` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`fcm_token` varchar(255),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `business_devices_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_fees` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`withdrawal` decimal(10,2) NOT NULL,
	`bill_payment` decimal(10,2) NOT NULL,
	`transfers` decimal(10,2) NOT NULL,
	`blue_to_blue` decimal(10,2) NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime,
	CONSTRAINT `business_fees_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_onboarding_forms` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`business_name` varchar(255) NOT NULL,
	`business_type` varchar(255) NOT NULL,
	`business_category` varchar(255) NOT NULL,
	`business_address` text NOT NULL,
	`state` varchar(100) NOT NULL,
	`branch_count` varchar(50) NOT NULL,
	`business_website` varchar(255),
	`contact_name` varchar(255) NOT NULL,
	`contact_role` varchar(100) NOT NULL,
	`contact_phone` varchar(20) NOT NULL,
	`contact_email` varchar(255),
	`accepts_digital_payments` tinyint NOT NULL DEFAULT 0,
	`payment_tools` text NOT NULL,
	`monthly_transactions` varchar(100) NOT NULL,
	`employee_count` varchar(50),
	`setup_needs` text NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `business_onboarding_forms_id` PRIMARY KEY(`id`),
	CONSTRAINT `id` UNIQUE(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_payment_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`branch_id` bigint unsigned,
	`staff_id` bigint unsigned,
	`amount` decimal(15,2),
	`narration` varchar(255),
	`order_reference` varchar(50),
	`receiver_name` varchar(250),
	`sender_name` varchar(200),
	`receiver_wallet` varchar(20),
	`client_used` enum('desktop','mobile') DEFAULT 'mobile',
	`due_date` datetime,
	`payment_mode` enum('blue-user','phone','offline','withdrawal','wallet_topup','card','bank_transfer') NOT NULL,
	`status` enum('in-progress','pending','successful','failed','reversed') NOT NULL DEFAULT 'pending',
	`transaction_id` varchar(30) NOT NULL,
	`verification_request` varchar(1000),
	`verification_response` varchar(1000),
	`service_charge` decimal(10,2) DEFAULT '0.00',
	`email` varchar(300),
	`request_body` varchar(1000),
	`response_body` varchar(1000),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`receiver_type` enum('personal','business','business-personal'),
	`sent_by` varchar(20),
	CONSTRAINT `business_payment_transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `unique_bus_transaction` UNIQUE(`transaction_id`,`business_id`)
);
--> statement-breakpoint
CREATE TABLE `business_pins` (
	`id` int AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned NOT NULL,
	`passcode` varchar(255),
	`created_at` datetime(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP(6)),
	`updated_at` datetime(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP(6)),
	`reset_pin_status` tinyint DEFAULT 0,
	CONSTRAINT `business_pins_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_power_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`branch_id` bigint unsigned,
	`staff_id` bigint unsigned,
	`meter_type` enum('prepaid','postpaid') NOT NULL,
	`receiver` varchar(15) NOT NULL,
	`provider` varchar(80) NOT NULL,
	`amount` decimal(12,2),
	`units` varchar(20),
	`token` varchar(30),
	`payment_reference` varchar(40),
	`customer_info` varchar(100),
	`customer_name` varchar(100),
	`meter_category` enum('MD','NON-MD'),
	`payment_mode` enum('wallet','card'),
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`access_token` varchar(40),
	`vend_request_body` varchar(1000),
	`transaction_id` varchar(30) NOT NULL,
	`phone` varchar(15),
	`slug` varchar(30),
	`minimum_amount` varchar(20),
	`service_charge` decimal(10,2) DEFAULT '100.00',
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`kct_1` varchar(100),
	`kct_2` varchar(100),
	`vend_response_body` varchar(1500),
	CONSTRAINT `business_power_transactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_profiles` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`user_id` bigint NOT NULL,
	`name` varchar(255),
	`description` varchar(255),
	`staff_size_min` int,
	`staff_size_max` int,
	`logo` varchar(255),
	`state` varchar(50),
	`address` varchar(255),
	`city` varchar(50),
	`lga` varchar(80),
	`level` int NOT NULL DEFAULT 0,
	`created_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`cac_number` varchar(50),
	`staff_size` varchar(100),
	`b_user_id` bigint unsigned,
	`bvn` varchar(20),
	`category` varchar(100) NOT NULL,
	CONSTRAINT `business_profiles_id` PRIMARY KEY(`id`),
	CONSTRAINT `UQ_29525485b1db8e87caf6a5ef042` UNIQUE(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_recovery_infos` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`recovery_code` varchar(40),
	`recovery_phone` varchar(20),
	`created_at` datetime,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`business_id` bigint NOT NULL,
	CONSTRAINT `business_recovery_infos_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_security_questions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`created_at` datetime,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`question` varchar(200) NOT NULL,
	`answer` varchar(200) NOT NULL,
	CONSTRAINT `business_security_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_settlement_accounts` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`business_id` bigint unsigned,
	`bank_id` bigint,
	`account_number` varchar(20),
	`account_name` varchar(255),
	`bank_name` varchar(200) NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `business_settlement_accounts_id` PRIMARY KEY(`id`),
	CONSTRAINT `unique_business_id` UNIQUE(`business_id`)
);
--> statement-breakpoint
CREATE TABLE `business_shareholders` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned NOT NULL,
	`name` varchar(255) NOT NULL,
	`address` varchar(255),
	`phone` varchar(255),
	`date_of_birth` varchar(255),
	`bvn` varchar(25),
	`verified` tinyint unsigned DEFAULT 0,
	`designation` varchar(100),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `business_shareholders_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_transaction_histories` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`branch_id` bigint unsigned,
	`staff_id` bigint unsigned,
	`transaction_id` varchar(30) NOT NULL,
	`receiver_name` varchar(100),
	`sender_name` varchar(100),
	`amount` decimal(15,2) NOT NULL,
	`status` enum('successful','pending','failed','in-progress') NOT NULL,
	`payment_mode` enum('blue-user','phone','offline','withdrawal','card','bank_transfer','airtime','data','power','cable-tv') NOT NULL,
	`type` enum('credit','debit') NOT NULL,
	`client_used` enum('desktop','mobile') NOT NULL DEFAULT 'mobile',
	`service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
	`created_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
	`balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
	CONSTRAINT `business_transaction_histories_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_tv_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned,
	`branch_id` bigint unsigned,
	`staff_id` bigint unsigned,
	`receiver` varchar(25) NOT NULL,
	`provider` varchar(80) NOT NULL,
	`package` varchar(80) NOT NULL,
	`amount` decimal(12,2),
	`payment_reference` varchar(40),
	`customer_info` varchar(100),
	`customer_name` varchar(100),
	`payment_mode` enum('wallet','card'),
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`access_token` varchar(40),
	`transaction_id` varchar(30) NOT NULL,
	`phone` varchar(15),
	`code` varchar(30),
	`service_charge` decimal(10,2) DEFAULT '100.00',
	`vend_request_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`vend_response_body` varchar(1500),
	CONSTRAINT `business_tv_transactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_users` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`phone` varchar(50) NOT NULL,
	`display_picture` varchar(1000),
	`is_deleted` tinyint unsigned DEFAULT 0,
	`flagged` tinyint NOT NULL DEFAULT 0,
	`verified` tinyint unsigned DEFAULT 0,
	`level` int DEFAULT 1,
	`notification_status` tinyint unsigned DEFAULT 0,
	`reset_credential_status` tinyint unsigned DEFAULT 0,
	`password` varchar(255),
	`password_changed_at` varchar(255),
	`kyc` enum('basic','intermediate','pro') NOT NULL DEFAULT 'basic',
	`business_profile_completed` tinyint unsigned DEFAULT 0,
	`business_details_completed` tinyint unsigned DEFAULT 0,
	`business_kyc_completed` tinyint unsigned DEFAULT 0,
	`proof_of_address_verified` tinyint unsigned DEFAULT 0,
	`auto_withdrawal_enabled` tinyint unsigned DEFAULT 0,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `business_users_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_phone_191uuwqwmc12` UNIQUE(`phone`),
	CONSTRAINT `phone` UNIQUE(`phone`)
);
--> statement-breakpoint
CREATE TABLE `business_wallet_accounts` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned NOT NULL,
	`wallet_id` bigint unsigned NOT NULL,
	`status` tinyint unsigned NOT NULL DEFAULT 0,
	`account_number` varchar(50),
	`account_name` varchar(50),
	`bank_name` varchar(250),
	`reference_number` varchar(100) NOT NULL,
	`request_body` varchar(1000),
	`response_body` varchar(1000),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `business_wallet_accounts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `business_wallet_snapshots` (
	`business_id` bigint unsigned,
	`type` enum('credit','debit') NOT NULL,
	`created_at` datetime(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP(6)),
	`updated_at` datetime(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP(6)),
	`id` int AUTO_INCREMENT NOT NULL,
	`transaction_id` varchar(20) NOT NULL,
	`wallet_id` int NOT NULL,
	`amount` decimal(12,2),
	`balance_before` decimal(12,2),
	`balance_after` decimal(12,2),
	CONSTRAINT `business_wallet_snapshots_id` PRIMARY KEY(`id`),
	CONSTRAINT `unique_bus_snapshot` UNIQUE(`transaction_id`,`business_id`)
);
--> statement-breakpoint
CREATE TABLE `business_wallets` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned NOT NULL,
	`balance` decimal(15,2) NOT NULL DEFAULT '0.00',
	`wallet_id` varchar(20) NOT NULL,
	`created_at` datetime(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP(6)),
	`updated_at` datetime(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP(6)),
	`wallet_code` varchar(20) NOT NULL,
	CONSTRAINT `business_wallets_id` PRIMARY KEY(`id`),
	CONSTRAINT `IDX_ff06839ff828223b3e3d33c2` UNIQUE(`wallet_id`)
);
--> statement-breakpoint
CREATE TABLE `dashme_idempotency_records` (
	`id` int AUTO_INCREMENT NOT NULL,
	`transaction_id` varchar(255) NOT NULL,
	`user_id` int NOT NULL,
	`operation_type` varchar(50) NOT NULL,
	`response_data` text NOT NULL,
	`created_at` datetime NOT NULL,
	CONSTRAINT `dashme_idempotency_records_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `dashme_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`amount` decimal(15,2) NOT NULL,
	`order_reference` varchar(50),
	`transaction_id` varchar(20),
	`receiver_id` bigint unsigned,
	`receiver_name` varchar(250),
	`receiver_wallet` varchar(20),
	`sender_wallet` varchar(300),
	`sender_name` varchar(250),
	`payment_mode` enum('blue-user','phone') NOT NULL,
	`due_date` datetime,
	`status` enum('pending','sent','successful','failed','reversed') NOT NULL DEFAULT 'pending',
	`service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
	`narration` varchar(255),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`due_at` datetime NOT NULL,
	CONSTRAINT `dashme_transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_transaction_id` UNIQUE(`transaction_id`),
	CONSTRAINT `unique_transaction` UNIQUE(`transaction_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `dashme_transactions_attempt_logs` (
	`id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`transaction_id` varchar(255) NOT NULL,
	`action` enum('accept','decline','initiate','confirm') NOT NULL,
	`ip_address` varchar(45) NOT NULL,
	`created_at` datetime NOT NULL,
	CONSTRAINT `dashme_transactions_attempt_logs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `data_packages` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`code` varchar(20) NOT NULL,
	`name` varchar(100) NOT NULL,
	`amount` decimal(12,2) NOT NULL DEFAULT '0.00',
	`validity` varchar(100),
	`provider` varchar(10) NOT NULL,
	`created_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`provider_slug` varchar(10) NOT NULL,
	CONSTRAINT `data_packages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `data_providers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(20) NOT NULL,
	`slug` varchar(20) NOT NULL,
	`image` varchar(200) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `data_providers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `data_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`receiver` varchar(25) NOT NULL,
	`provider` varchar(80) NOT NULL,
	`package` varchar(300) NOT NULL,
	`amount` decimal(12,2) unsigned,
	`payment_reference` varchar(40),
	`customer_info` varchar(100),
	`customer_name` varchar(100),
	`payment_mode` enum('wallet','card'),
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`transaction_id` varchar(30) NOT NULL,
	`phone` varchar(15),
	`provider_slug` varchar(30),
	`access_token` varchar(40),
	`vend_request_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`code` varchar(10),
	`vend_response_body` varchar(1500),
	`balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
	`balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
	CONSTRAINT `data_transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `unq_airtime_txn` UNIQUE(`transaction_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `deleted_accounts` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`reason_id` bigint unsigned NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `deleted_accounts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `document_types` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`created_at` datetime NOT NULL,
	CONSTRAINT `document_types_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `flagged_users` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`type` enum('personal','business') NOT NULL,
	`reason` text NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`admin_id` bigint unsigned NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `flagged_users_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `irchg_banks` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`code` varchar(20) NOT NULL,
	`bank_code` varchar(20),
	`name` varchar(150) NOT NULL,
	`logo_url` varchar(100),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `irchg_banks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `irecharge_data_packages` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`code` varchar(20) NOT NULL,
	`title` varchar(100) NOT NULL,
	`validity` varchar(100),
	`price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `irecharge_data_packages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `irecharge_power_providers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`description` varchar(100) NOT NULL,
	`slug` varchar(15) NOT NULL,
	`code` varchar(100) NOT NULL,
	`minimum_value` decimal(12,2) unsigned DEFAULT '0.00',
	`maximum_value` decimal(12,2) unsigned DEFAULT '0.00',
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `irecharge_power_providers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `irecharge_tv_packages` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(100) NOT NULL,
	`network` varchar(15) NOT NULL,
	`price` decimal(12,2) unsigned DEFAULT '0.00',
	`code` varchar(100) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `irecharge_tv_packages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `kycs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`document_type_id` bigint unsigned,
	`bvn` varchar(50) NOT NULL,
	`date_of_birth` date NOT NULL,
	`country` varchar(50),
	`front_cover` varchar(300),
	`back_cover` varchar(300),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`documents` varchar(3000),
	CONSTRAINT `kycs_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `migrations` (
	`id` int AUTO_INCREMENT NOT NULL,
	`timestamp` bigint NOT NULL,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `migrations_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `notifications` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`status` tinyint unsigned DEFAULT 0,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `notifications_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `otps` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`code` varchar(10) NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`business_id` bigint unsigned,
	CONSTRAINT `otps_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `payment_links` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`transaction_id` varchar(20) NOT NULL,
	`url_code` varchar(20) NOT NULL,
	`original_url` varchar(255) NOT NULL,
	`amount` decimal(15,2),
	`phone` varchar(20),
	`sender_name` varchar(300),
	`verified_account` tinyint DEFAULT 0,
	`clicked` tinyint unsigned DEFAULT 0,
	`status` enum('failed','sent','processing','fulfilled','cancelled','withdrawn','reversed') DEFAULT 'sent',
	`platform_used` varchar(20),
	`receiver_name` varchar(255),
	`batch` varchar(120),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`api_response` varchar(1500),
	`account_number` varchar(15),
	`bank` varchar(60),
	`reference` varchar(20),
	`recipient_code` varchar(20),
	`business_id` bigint unsigned,
	`narration` varchar(255),
	`type` enum('personal','business') NOT NULL DEFAULT 'personal',
	`request_body` varchar(10000),
	`response_body` varchar(10000),
	`idempotency_key` varchar(100),
	CONSTRAINT `payment_links_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `payments` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`transaction_id` varchar(20) NOT NULL,
	`amount` decimal(15,2) NOT NULL,
	`response_body` varchar(1000) NOT NULL,
	`created_at` datetime NOT NULL,
	`account_number` varchar(12) NOT NULL,
	CONSTRAINT `payments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `paystack_banks` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`code` varchar(20) NOT NULL,
	`bank_code` varchar(20),
	`name` varchar(150) NOT NULL,
	`logo_url` varchar(100),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `paystack_banks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `pilot_testers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`email` varchar(150) NOT NULL,
	`phone` varchar(20) NOT NULL,
	`platform` text NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `pilot_testers_id` PRIMARY KEY(`id`),
	CONSTRAINT `email` UNIQUE(`email`),
	CONSTRAINT `phone` UNIQUE(`phone`)
);
--> statement-breakpoint
CREATE TABLE `pins` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`passcode` varchar(255),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `pins_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `power_providers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(80) NOT NULL,
	`slug` varchar(10) NOT NULL,
	`locations` varchar(255) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `power_providers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `power_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`meter_type` enum('prepaid','postpaid') NOT NULL,
	`receiver` varchar(25) NOT NULL,
	`provider` varchar(80) NOT NULL,
	`amount` decimal(12,2) unsigned,
	`units` varchar(20),
	`token` varchar(30),
	`payment_reference` varchar(40),
	`customer_info` varchar(100),
	`customer_name` varchar(100),
	`meter_category` enum('MD','NON-MD'),
	`payment_mode` enum('wallet','card'),
	`status` enum('pending','successful','failed','processing') NOT NULL DEFAULT 'pending',
	`access_token` varchar(40),
	`vend_request_body` varchar(1000),
	`transaction_id` varchar(30) NOT NULL,
	`phone` varchar(15),
	`slug` varchar(30),
	`minimum_amount` varchar(20),
	`service_charge` decimal(10,2) DEFAULT '100.00',
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`kct_1` varchar(100),
	`kct_2` varchar(100),
	`vend_response_body` varchar(1500),
	`balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
	`balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
	CONSTRAINT `power_transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `unq_airtime_txn` UNIQUE(`transaction_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `reasons` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`content` varchar(50) NOT NULL,
	CONSTRAINT `reasons_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `recovery_infos` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`recovery_code` varchar(255),
	`recovery_phone` varchar(255),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `recovery_infos_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `report_preferences` (
	`id` int AUTO_INCREMENT NOT NULL,
	`business_id` bigint unsigned NOT NULL,
	`email` varchar(255) NOT NULL,
	`is_active` tinyint NOT NULL DEFAULT 1,
	`schedule_time` varchar(10) NOT NULL DEFAULT '23:00',
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `report_preferences_id` PRIMARY KEY(`id`),
	CONSTRAINT `UQ_8bd9422c2c9e0ca8ab0df102c5e` UNIQUE(`id`)
);
--> statement-breakpoint
CREATE TABLE `security_questions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`question` varchar(200) NOT NULL,
	`answer` varchar(200) NOT NULL,
	CONSTRAINT `security_questions_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `sms_logs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`request_body` varchar(1000),
	`response_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `sms_logs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `staff_profiles` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`user_id` bigint,
	`name` varchar(255) NOT NULL,
	`phone` varchar(150) NOT NULL,
	`password` varchar(200) NOT NULL,
	`password_changed_at` varchar(50),
	`is_active` tinyint NOT NULL DEFAULT 1,
	`created_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`owner_id` bigint,
	`role` enum('admin','cashier') NOT NULL,
	`branch_id` bigint unsigned,
	`display_picture` varchar(255),
	`branch_name` varchar(255),
	`business_id` bigint unsigned,
	CONSTRAINT `staff_profiles_id` PRIMARY KEY(`id`),
	CONSTRAINT `UQ_6d4c6c0b447e39147b4a6dcbede` UNIQUE(`id`)
);
--> statement-breakpoint
CREATE TABLE `staff_roles` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `staff_roles_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `temp_accounts` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`reference` varchar(50) NOT NULL,
	`account_name` varchar(100) NOT NULL,
	`account_number` varchar(50) NOT NULL,
	`bank_id` varchar(50) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`bank_name` varchar(200) NOT NULL,
	CONSTRAINT `temp_accounts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `temp_recovery_phones` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`reference` varchar(30) NOT NULL,
	`old_phone` varchar(15) NOT NULL,
	`new_phone` varchar(15) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `temp_recovery_phones_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `transaction_histories` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`transaction_id` bigint unsigned,
	`receiver_name` varchar(250),
	`amount` decimal(15,2) unsigned NOT NULL,
	`status` enum('successful','pending','failed','in-progress','refunded') NOT NULL,
	`payment_mode` enum('blue-user','phone','wallet_topup','offline','withdrawal','card','bank-transfer','airtime','data','power','cable-tv') NOT NULL,
	`type` enum('credit','debit') NOT NULL,
	`sender_name` varchar(100),
	`client_used` enum('desktop','mobile') NOT NULL DEFAULT 'mobile',
	`transaction_reference` varchar(20),
	`service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
	`created_at` datetime NOT NULL,
	`employee_id` bigint,
	`balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
	`balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
	`app` varchar(100),
	`narration` varchar(300),
	CONSTRAINT `transaction_histories_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`amount` decimal(15,2) NOT NULL,
	`order_reference` varchar(50),
	`receiver_name` varchar(250),
	`receiver_wallet` varchar(20),
	`sender_name` varchar(300),
	`payment_mode` enum('blue-user','phone','offline','withdrawal','wallet_topup','card','bank_transfer') NOT NULL,
	`client_used` enum('desktop','mobile') DEFAULT 'mobile',
	`due_date` datetime,
	`status` enum('in-progress','pending','successful','failed','reversed') NOT NULL DEFAULT 'pending',
	`transaction_id` varchar(20),
	`service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
	`email` varchar(255),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`employee_id` bigint,
	`narration` varchar(255),
	`request_body` varchar(1000),
	`response_body` varchar(10000),
	`verification_request` varchar(1000),
	`verification_response` varchar(1000),
	`ip` varchar(20),
	`receiver_type` enum('personal','business','business-personal'),
	`sent_by` varchar(20),
	`branch_id` bigint,
	CONSTRAINT `transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_transaction_id` UNIQUE(`transaction_id`),
	CONSTRAINT `unique_transaction` UNIQUE(`transaction_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `tv_packages` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`provider` varchar(10) NOT NULL,
	`code` varchar(20) NOT NULL,
	`name` varchar(100) NOT NULL,
	`amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
	`created_at` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `tv_packages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `tv_providers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(80) NOT NULL,
	`slug` varchar(10) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`image` varchar(200) NOT NULL,
	CONSTRAINT `tv_providers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `tv_transactions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`receiver` varchar(25) NOT NULL,
	`provider` varchar(80) NOT NULL,
	`package` varchar(80) NOT NULL,
	`amount` decimal(12,2) unsigned,
	`payment_reference` varchar(40),
	`customer_info` varchar(100),
	`customer_name` varchar(100),
	`payment_mode` enum('wallet','card'),
	`status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
	`access_token` varchar(40),
	`transaction_id` varchar(30) NOT NULL,
	`phone` varchar(15),
	`code` varchar(200),
	`service_charge` decimal(10,2) DEFAULT '100.00',
	`vend_request_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`vend_response_body` varchar(1500),
	`balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
	`balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
	CONSTRAINT `tv_transactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `unq_airtime_txn` UNIQUE(`transaction_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `user_accounts` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`bank_id` bigint unsigned NOT NULL,
	`account_number` varchar(255),
	`account_name` varchar(255),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`bank_name` varchar(50) NOT NULL,
	CONSTRAINT `user_accounts_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `user_card_details` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`email` varchar(255) NOT NULL,
	`authorization_code` varchar(80) NOT NULL,
	`bin` varchar(20) NOT NULL,
	`last4` varchar(20) NOT NULL,
	`exp_month` varchar(20) NOT NULL,
	`exp_year` varchar(20) NOT NULL,
	`card_type` varchar(20) NOT NULL,
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`first_name` varchar(60),
	`last_name` varchar(60),
	`bank` varchar(60),
	CONSTRAINT `user_card_details_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_tokens` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`fcm_token` varchar(255),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `user_tokens_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`first_name` varchar(255),
	`middle_name` varchar(255),
	`last_name` varchar(255),
	`phone` varchar(50) NOT NULL,
	`role` enum('owner','employee') DEFAULT 'owner',
	`type` enum('personal','business','business_personal') DEFAULT 'personal',
	`display_pic` varchar(1000),
	`level` int DEFAULT 1,
	`password` varchar(255),
	`passwordChangedAt` varchar(255),
	`is_deleted` tinyint unsigned DEFAULT 0,
	`flagged` tinyint NOT NULL DEFAULT 0,
	`verified` tinyint unsigned DEFAULT 0,
	`reset_credential_status` tinyint unsigned DEFAULT 0,
	`notification_status` tinyint NOT NULL DEFAULT 1,
	`kyc_status` tinyint unsigned DEFAULT 0,
	`kyc` enum('basic','intermediate','pro') NOT NULL DEFAULT 'basic',
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `users_id` PRIMARY KEY(`id`),
	CONSTRAINT `phone` UNIQUE(`phone`)
);
--> statement-breakpoint
CREATE TABLE `ussd_withdrawals` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`bank_code` varchar(20),
	`phone_number` varchar(20),
	`account_number` varchar(20),
	`session_id` varchar(150),
	`amount` decimal(8,2) NOT NULL,
	`account_info` varchar(200),
	`transaction_id` varchar(40),
	`reference` varchar(50),
	`status` enum('in-progress','pending','successful','failed') NOT NULL DEFAULT 'pending',
	`verification_request_body` varchar(500),
	`verification_response_body` varchar(1000),
	`transfer_request_body` varchar(500),
	`transfer_response_body` varchar(1000),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `ussd_withdrawals_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `wallet_accounts` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`wallet_id` bigint unsigned NOT NULL,
	`status` tinyint unsigned NOT NULL DEFAULT 0,
	`account_number` varchar(50),
	`account_name` varchar(50),
	`bank_name` varchar(250),
	`reference_number` varchar(100) NOT NULL,
	`request_body` varchar(1000),
	`response_body` varchar(1000),
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`bank_logo` varchar(255),
	CONSTRAINT `wallet_accounts_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `wallet_snapshots` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`wallet_id` bigint unsigned NOT NULL,
	`amount` decimal(15,2) NOT NULL,
	`balance_before` decimal(15,2) NOT NULL,
	`balance_after` decimal(15,2) NOT NULL,
	`type` enum('credit','debit') NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`transaction_reference` varchar(20),
	`is_new` tinyint DEFAULT 1,
	CONSTRAINT `wallet_snapshots_id` PRIMARY KEY(`id`),
	CONSTRAINT `unique_user_transaction_type` UNIQUE(`user_id`,`transaction_reference`,`type`),
	CONSTRAINT `balance_before_non_negative` CHECK((`balance_before` >= 0))
);
--> statement-breakpoint
CREATE TABLE `wallets` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`balance` decimal(15,2) unsigned DEFAULT '0.00',
	`wallet_id` varchar(20) NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`wallet_code` varchar(20) NOT NULL,
	CONSTRAINT `wallets_id` PRIMARY KEY(`id`),
	CONSTRAINT `idx_user_id` UNIQUE(`user_id`),
	CONSTRAINT `idx_wallet_code` UNIQUE(`wallet_id`),
	CONSTRAINT `wallet_code` UNIQUE(`wallet_id`),
	CONSTRAINT `balance_non_negative` CHECK((`balance` >= 0))
);
--> statement-breakpoint
CREATE TABLE `withdraw_credentials` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`token` varchar(50) NOT NULL,
	`token_ttl` datetime NOT NULL,
	`phone` varchar(50),
	`username` varchar(50),
	`secret_pwd` varchar(50),
	`secret_pin` varchar(50),
	`charge_rate` decimal(5,0),
	`created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `withdraw_credentials_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `withdraw_idempotency_records` (
	`id` int AUTO_INCREMENT NOT NULL,
	`transaction_id` varchar(255) NOT NULL,
	`user_id` int NOT NULL,
	`operation_type` varchar(50) NOT NULL,
	`response_data` text NOT NULL,
	`created_at` datetime NOT NULL,
	CONSTRAINT `withdraw_idempotency_records_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `airtime_transactions` ADD CONSTRAINT `airtime_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bill_mates_favourites` ADD CONSTRAINT `bill_mates_favourites_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
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
ALTER TABLE `wallets` ADD CONSTRAINT `wallets_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX `idx_receiver` ON `airtime_transactions` (`receiver`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `airtime_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `beneficiary_id` ON `beneficiaries` (`beneficiary_id`);--> statement-breakpoint
CREATE INDEX `idx_business_id` ON `beneficiaries` (`business_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `beneficiaries` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `bill_mates_favourites` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_created_at` ON `bill_mates_transactions` (`created_at`);--> statement-breakpoint
CREATE INDEX `idx_status` ON `bill_mates_transactions` (`status`);--> statement-breakpoint
CREATE INDEX `idx_transaction_reference` ON `bill_mates_transactions` (`transaction_reference`);--> statement-breakpoint
CREATE INDEX `idx_type` ON `bill_mates_transactions` (`type`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `bill_mates_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `business_id` ON `business_branches` (`business_id`);--> statement-breakpoint
CREATE INDEX `business_id` ON `business_pins` (`business_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `business_recovery_infos` (`user_id`);--> statement-breakpoint
CREATE INDEX `business_id` ON `business_shareholders` (`business_id`);--> statement-breakpoint
CREATE INDEX `fk_txnhistory_branch_id` ON `business_transaction_histories` (`branch_id`);--> statement-breakpoint
CREATE INDEX `fk_txnhistory_staff_id` ON `business_transaction_histories` (`staff_id`);--> statement-breakpoint
CREATE INDEX `idx_business_id` ON `business_transaction_histories` (`business_id`);--> statement-breakpoint
CREATE INDEX `idx_created_at` ON `business_transaction_histories` (`created_at`);--> statement-breakpoint
CREATE INDEX `idx_payment_mode` ON `business_transaction_histories` (`payment_mode`);--> statement-breakpoint
CREATE INDEX `idx_status` ON `business_transaction_histories` (`status`);--> statement-breakpoint
CREATE INDEX `idx_transaction_reference` ON `business_transaction_histories` (`transaction_id`);--> statement-breakpoint
CREATE INDEX `business_id` ON `business_wallet_accounts` (`business_id`);--> statement-breakpoint
CREATE INDEX `wallet_id` ON `business_wallet_accounts` (`wallet_id`);--> statement-breakpoint
CREATE INDEX `business_id` ON `business_wallets` (`business_id`);--> statement-breakpoint
CREATE INDEX `created_at` ON `dashme_idempotency_records` (`created_at`);--> statement-breakpoint
CREATE INDEX `transaction_id` ON `dashme_idempotency_records` (`transaction_id`,`user_id`,`operation_type`);--> statement-breakpoint
CREATE INDEX `idx_created_at` ON `dashme_transactions` (`created_at`);--> statement-breakpoint
CREATE INDEX `idx_payment_mode` ON `dashme_transactions` (`payment_mode`);--> statement-breakpoint
CREATE INDEX `idx_status` ON `dashme_transactions` (`status`);--> statement-breakpoint
CREATE INDEX `receiver_id` ON `dashme_transactions` (`receiver_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `dashme_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `dashme_transactions_attempt_logs` (`user_id`,`action`,`created_at`);--> statement-breakpoint
CREATE INDEX `idx_receiver` ON `data_transactions` (`receiver`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `data_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `reason_id` ON `deleted_accounts` (`reason_id`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `flagged_users` (`user_id`);--> statement-breakpoint
CREATE INDEX `document_type_id` ON `kycs` (`document_type_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `kycs` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `notifications` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `otps` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `pins` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_meter_type` ON `power_transactions` (`meter_type`);--> statement-breakpoint
CREATE INDEX `idx_receiver` ON `power_transactions` (`receiver`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `power_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `recovery_infos` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `security_questions` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_created_at` ON `transaction_histories` (`created_at`);--> statement-breakpoint
CREATE INDEX `idx_payment_mode` ON `transaction_histories` (`payment_mode`);--> statement-breakpoint
CREATE INDEX `idx_transaction_reference` ON `transaction_histories` (`transaction_reference`);--> statement-breakpoint
CREATE INDEX `user_id` ON `transaction_histories` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_created_at` ON `transactions` (`created_at`);--> statement-breakpoint
CREATE INDEX `idx_payment_mode` ON `transactions` (`payment_mode`);--> statement-breakpoint
CREATE INDEX `idx_status` ON `transactions` (`status`);--> statement-breakpoint
CREATE INDEX `user_id` ON `transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_receiver` ON `tv_transactions` (`receiver`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `tv_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `bank_id` ON `user_accounts` (`bank_id`);--> statement-breakpoint
CREATE INDEX `idx_user_id` ON `user_card_details` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `user_tokens` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_id` ON `users` (`id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `wallet_accounts` (`user_id`);--> statement-breakpoint
CREATE INDEX `wallet_id` ON `wallet_accounts` (`wallet_id`);--> statement-breakpoint
CREATE INDEX `idx_transaction_reference` ON `wallet_snapshots` (`transaction_reference`);--> statement-breakpoint
CREATE INDEX `wallet_id` ON `wallet_snapshots` (`wallet_id`);--> statement-breakpoint
CREATE INDEX `ws_idx_created_at` ON `wallet_snapshots` (`created_at`);--> statement-breakpoint
CREATE INDEX `ws_idx_type` ON `wallet_snapshots` (`type`);--> statement-breakpoint
CREATE INDEX `ws_idx_user_id` ON `wallet_snapshots` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `wallets` (`user_id`);--> statement-breakpoint
CREATE INDEX `created_at` ON `withdraw_idempotency_records` (`created_at`);--> statement-breakpoint
CREATE INDEX `transaction_id` ON `withdraw_idempotency_records` (`transaction_id`,`user_id`,`operation_type`);