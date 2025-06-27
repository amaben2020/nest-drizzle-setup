ALTER TABLE `business_onboarding_forms` MODIFY COLUMN `accepts_digital_payments` boolean;--> statement-breakpoint
ALTER TABLE `business_onboarding_forms` MODIFY COLUMN `accepts_digital_payments` boolean DEFAULT false;--> statement-breakpoint
ALTER TABLE `business_users` MODIFY COLUMN `flagged` boolean;--> statement-breakpoint
ALTER TABLE `business_users` MODIFY COLUMN `flagged` boolean DEFAULT false;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `flagged` boolean;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `flagged` boolean DEFAULT false;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_best_friend` boolean;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_best_friend` boolean DEFAULT false;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_new` boolean;--> statement-breakpoint
ALTER TABLE `usersTest` MODIFY COLUMN `is_new` boolean DEFAULT false;