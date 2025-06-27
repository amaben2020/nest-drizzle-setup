RENAME TABLE `business_payment_transactions` TO `bus_pay_trans`;--> statement-breakpoint
ALTER TABLE `bus_pay_trans` DROP FOREIGN KEY `business_payment_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `bus_pay_trans` DROP FOREIGN KEY `business_payment_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `bus_pay_trans` DROP FOREIGN KEY `business_payment_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `bus_pay_trans` ADD CONSTRAINT `bus_pay_trans_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bus_pay_trans` ADD CONSTRAINT `bus_pay_trans_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bus_pay_trans` ADD CONSTRAINT `bus_pay_trans_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;