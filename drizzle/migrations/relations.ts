import { relations } from 'drizzle-orm/relations';
import { users, airtimeTransactions, billMatesFavourites } from './schema';

export const airtimeTransactionsRelations = relations(
  airtimeTransactions,
  ({ one }) => ({
    user: one(users, {
      fields: [airtimeTransactions.userId],
      references: [users.id],
    }),
  }),
);

export const usersRelations = relations(users, ({ many }) => ({
  airtimeTransactions: many(airtimeTransactions),
  billMatesFavourites: many(billMatesFavourites),
}));

export const billMatesFavouritesRelations = relations(
  billMatesFavourites,
  ({ one }) => ({
    user: one(users, {
      fields: [billMatesFavourites.userId],
      references: [users.id],
    }),
  }),
);
