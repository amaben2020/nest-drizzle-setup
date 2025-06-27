RENAME TABLE `bus_pay_trans` TO `business_payment_transactions`;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `bus_pay_trans_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `bus_pay_trans_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP FOREIGN KEY `bus_pay_trans_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `business_payment_transactions` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` MODIFY COLUMN `id` bigint unsigned AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `unique_bus_transaction` UNIQUE(`transaction_id`,`business_id`);--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `business_payment_transactions_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `business_payment_transactions_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD CONSTRAINT `business_payment_transactions_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;