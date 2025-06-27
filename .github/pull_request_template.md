## ✅ Pull Request Checklist

- [ ] Did you run `npx drizzle-kit pull` after making schema changes?
- [ ] Did you commit updated `schema.ts` and `migrations/`?
- [ ] Did you test in `dev` before merging to `staging`?

> Note: Schema changes will automatically be pushed to the appropriate DB on merge.

### Steps for updating local database:

Say you don't have schema

1. npx drizzle-kit pull --config=drizzle.config.ts (Step 1: Make schema changes
   Edit or create tables in your src/database/schema.ts., you could skip this if you already have blue-personal-v2/src/database/schema.ts)
2. npx drizzle-kit generate --config=drizzle.config.ts (Step 2: Pull existing DB structure (optional safety), simply update the table you created)
3.
4. npm run db:push:dev (Step 3: Generate migration SQL from your edits)
<!-- 4. npm run migrate:dev -->

When you update or create new tables

🚨 Warning: Avoid editing drizzle/migrations/\*.sql by hand unless you know what you're doing.

Note: Sometimes its not so straightforward, correct the schema.ts file first then do step 2 again.

if you see a message like this:
Warning Found data-loss statements:
· You're about to delete business_airtime_transactions table with 6 items
· You're about to change is_active column type from tinyint(1) to tinyint with 25 items
· You're about to change accepts_digital_payments column type from tinyint(1) to tinyint with 1 items
· You're about to change flagged column type from tinyint(1) to tinyint with 147 items
· You're about to change api_response column type from varchar(1500) to text with 180 items
· You're about to change request_body column type from varchar(10000) to text with 180 items
· You're about to change response_body column type from varchar(10000) to text with 180 items
· You're about to change is_active column type from tinyint(1) to tinyint with 2 items
· You're about to change is_active column type from tinyint(1) to tinyint with 29 items
· You're about to change flagged column type from tinyint(1) to tinyint with 14770 items
· You're about to change is_new column type from tinyint(1) to tinyint with 5743 items

THIS ACTION WILL CAUSE DATA LOSS AND CANNOT BE REVERTED

Do you still want to push changes?
[x] All changes were aborted
➜ blue-personal-v2 git:(main) npx drizzle-kit generate --config=drizzle.config.ts

manually update the schema.ts file

Scenario
We have a db and wanna update current setup

1. npm run introspect: pulls in fresh data from db
2. npx drizzle-kit generate --config=drizzle.config.ts
3. npm run db:push:dev
