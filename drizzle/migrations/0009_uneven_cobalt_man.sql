ALTER TABLE `payment_links` MODIFY COLUMN `api_response` text;--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `request_body` text;--> statement-breakpoint
ALTER TABLE `payment_links` MODIFY COLUMN `response_body` text;--> statement-breakpoint
ALTER TABLE `usersTest` ADD `is_online` varchar(255);