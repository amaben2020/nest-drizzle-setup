ALTER TABLE `business_payment_transactions` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `business_payment_transactions` ADD PRIMARY KEY(`id`);