DROP TABLE `business_airtime_transactions`;--> statement-breakpoint
ALTER TABLE `business_branches` DROP FOREIGN KEY `business_branches_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP FOREIGN KEY `business_data_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `business_payment_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `business_payment_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `business_payment_transactions_staff_id_staff_profiles_id_fk`;
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
