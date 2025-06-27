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
