CREATE TABLE `bus_pay_trans` (
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
DROP TABLE `business_payment_transactions`;--> statement-breakpoint
ALTER TABLE `business_data_transactions` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `business_data_transactions` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `bus_pay_trans` ADD CONSTRAINT `bus_pay_trans_business_id_business_profiles_id_fk` FOREIGN KEY (`business_id`) REFERENCES `business_profiles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bus_pay_trans` ADD CONSTRAINT `bus_pay_trans_branch_id_business_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `business_branches`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bus_pay_trans` ADD CONSTRAINT `bus_pay_trans_staff_id_staff_profiles_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff_profiles`(`id`) ON DELETE set null ON UPDATE no action;