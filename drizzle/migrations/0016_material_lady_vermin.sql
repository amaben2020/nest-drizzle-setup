RENAME TABLE `business_airtime_transactions` TO `bus_airtime_trans`;--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` DROP FOREIGN KEY `business_airtime_transactions_business_id_business_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` DROP FOREIGN KEY `business_airtime_transactions_branch_id_business_branches_id_fk`;
--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` DROP FOREIGN KEY `business_airtime_transactions_staff_id_staff_profiles_id_fk`;
--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` ADD CONSTRAINT `bus_airtime_trans_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` ADD CONSTRAINT `bus_airtime_trans_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bus_airtime_trans` ADD CONSTRAINT `bus_airtime_trans_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;