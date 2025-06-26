## ✅ Pull Request Checklist

- [ ] Did you run `npx drizzle-kit pull` after making schema changes?
- [ ] Did you commit updated `schema.ts` and `migrations/`?
- [ ] Did you test in `dev` before merging to `staging`?

> Note: Schema changes will automatically be pushed to the appropriate DB on merge.

### Steps for updating local database:

1. npx drizzle-kit pull --config=drizzle.config.ts (Step 1: Make schema changes
   Edit or create tables in your src/database/schema.ts.)
2. npx drizzle-kit generate --config=drizzle.config.ts (Step 2: Pull existing DB structure (optional safety))
3. npm run db:push:dev (Step 3: Generate migration SQL from your edits)
4. npm run migrate:dev

🚨 Warning: Avoid editing drizzle/migrations/\*.sql by hand unless you know what you're doing.
