import { relations } from 'drizzle-orm/relations';
import {
  users,
  airtimeTransactions,
  billMatesFavourites,
  businessBranches,
  businessAirtimeTransactions,
  businessProfiles,
  staffProfiles,
  businessDataTransactions,
  businessPaymentTransactions,
  businessPins,
  businessPowerTransactions,
  businessUsers,
  businessRecoveryInfos,
  businessSettlementAccounts,
  businessShareholders,
  businessTvTransactions,
  businessWalletAccounts,
  businessWallets,
  businessWalletSnapshots,
  dashmeTransactions,
  dataTransactions,
  reasons,
  deletedAccounts,
  documentTypes,
  kycs,
  notifications,
  otps,
  pins,
  powerTransactions,
  recoveryInfos,
  reportPreferences,
  securityQuestions,
  transactions,
  tvTransactions,
  userAccounts,
  userCardDetails,
  userTokens,
  wallets,
  walletAccounts,
} from './schema';

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
  dashmeTransactions: many(dashmeTransactions),
  dataTransactions: many(dataTransactions),
  kycs: many(kycs),
  notifications: many(notifications),
  otps: many(otps),
  pins: many(pins),
  powerTransactions: many(powerTransactions),
  recoveryInfos: many(recoveryInfos),
  securityQuestions: many(securityQuestions),
  transactions: many(transactions),
  tvTransactions: many(tvTransactions),
  userAccounts: many(userAccounts),
  userCardDetails: many(userCardDetails),
  userTokens: many(userTokens),
  walletAccounts: many(walletAccounts),
  wallets: many(wallets),
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

export const businessAirtimeTransactionsRelations = relations(
  businessAirtimeTransactions,
  ({ one }) => ({
    businessBranch: one(businessBranches, {
      fields: [businessAirtimeTransactions.branchId],
      references: [businessBranches.id],
    }),
    businessProfile: one(businessProfiles, {
      fields: [businessAirtimeTransactions.businessId],
      references: [businessProfiles.id],
    }),
    staffProfile: one(staffProfiles, {
      fields: [businessAirtimeTransactions.staffId],
      references: [staffProfiles.id],
    }),
  }),
);

export const businessBranchesRelations = relations(
  businessBranches,
  ({ one, many }) => ({
    businessAirtimeTransactions: many(businessAirtimeTransactions),
    businessProfile: one(businessProfiles, {
      fields: [businessBranches.businessId],
      references: [businessProfiles.id],
    }),
    businessDataTransactions: many(businessDataTransactions),
    businessPaymentTransactions: many(businessPaymentTransactions),
    businessPowerTransactions: many(businessPowerTransactions),
    businessTvTransactions: many(businessTvTransactions),
    staffProfiles: many(staffProfiles),
  }),
);

export const businessProfilesRelations = relations(
  businessProfiles,
  ({ one, many }) => ({
    businessAirtimeTransactions: many(businessAirtimeTransactions),
    businessBranches: many(businessBranches),
    businessDataTransactions: many(businessDataTransactions),
    businessPaymentTransactions: many(businessPaymentTransactions),
    businessPins: many(businessPins),
    businessPowerTransactions: many(businessPowerTransactions),
    businessUser: one(businessUsers, {
      fields: [businessProfiles.bUserId],
      references: [businessUsers.id],
    }),
    businessSettlementAccounts: many(businessSettlementAccounts),
    businessShareholders: many(businessShareholders),
    businessTvTransactions: many(businessTvTransactions),
    businessWalletAccounts: many(businessWalletAccounts),
    businessWalletSnapshots: many(businessWalletSnapshots),
    businessWallets: many(businessWallets),
    reportPreferences: many(reportPreferences),
    staffProfiles: many(staffProfiles),
  }),
);

export const staffProfilesRelations = relations(
  staffProfiles,
  ({ one, many }) => ({
    businessAirtimeTransactions: many(businessAirtimeTransactions),
    businessDataTransactions: many(businessDataTransactions),
    businessPaymentTransactions: many(businessPaymentTransactions),
    businessPowerTransactions: many(businessPowerTransactions),
    businessTvTransactions: many(businessTvTransactions),
    businessBranch: one(businessBranches, {
      fields: [staffProfiles.branchId],
      references: [businessBranches.id],
    }),
    businessProfile: one(businessProfiles, {
      fields: [staffProfiles.businessId],
      references: [businessProfiles.id],
    }),
  }),
);

export const businessDataTransactionsRelations = relations(
  businessDataTransactions,
  ({ one }) => ({
    businessBranch: one(businessBranches, {
      fields: [businessDataTransactions.branchId],
      references: [businessBranches.id],
    }),
    businessProfile: one(businessProfiles, {
      fields: [businessDataTransactions.businessId],
      references: [businessProfiles.id],
    }),
    staffProfile: one(staffProfiles, {
      fields: [businessDataTransactions.staffId],
      references: [staffProfiles.id],
    }),
  }),
);

export const businessPaymentTransactionsRelations = relations(
  businessPaymentTransactions,
  ({ one }) => ({
    businessBranch: one(businessBranches, {
      fields: [businessPaymentTransactions.branchId],
      references: [businessBranches.id],
    }),
    businessProfile: one(businessProfiles, {
      fields: [businessPaymentTransactions.businessId],
      references: [businessProfiles.id],
    }),
    staffProfile: one(staffProfiles, {
      fields: [businessPaymentTransactions.staffId],
      references: [staffProfiles.id],
    }),
  }),
);

export const businessPinsRelations = relations(businessPins, ({ one }) => ({
  businessProfile: one(businessProfiles, {
    fields: [businessPins.businessId],
    references: [businessProfiles.id],
  }),
}));

export const businessPowerTransactionsRelations = relations(
  businessPowerTransactions,
  ({ one }) => ({
    businessBranch: one(businessBranches, {
      fields: [businessPowerTransactions.branchId],
      references: [businessBranches.id],
    }),
    businessProfile: one(businessProfiles, {
      fields: [businessPowerTransactions.businessId],
      references: [businessProfiles.id],
    }),
    staffProfile: one(staffProfiles, {
      fields: [businessPowerTransactions.staffId],
      references: [staffProfiles.id],
    }),
  }),
);

export const businessUsersRelations = relations(businessUsers, ({ many }) => ({
  businessProfiles: many(businessProfiles),
  businessRecoveryInfos: many(businessRecoveryInfos),
}));

export const businessRecoveryInfosRelations = relations(
  businessRecoveryInfos,
  ({ one }) => ({
    businessUser: one(businessUsers, {
      fields: [businessRecoveryInfos.userId],
      references: [businessUsers.id],
    }),
  }),
);

export const businessSettlementAccountsRelations = relations(
  businessSettlementAccounts,
  ({ one }) => ({
    businessProfile: one(businessProfiles, {
      fields: [businessSettlementAccounts.businessId],
      references: [businessProfiles.id],
    }),
  }),
);

export const businessShareholdersRelations = relations(
  businessShareholders,
  ({ one }) => ({
    businessProfile: one(businessProfiles, {
      fields: [businessShareholders.businessId],
      references: [businessProfiles.id],
    }),
  }),
);

export const businessTvTransactionsRelations = relations(
  businessTvTransactions,
  ({ one }) => ({
    businessBranch: one(businessBranches, {
      fields: [businessTvTransactions.branchId],
      references: [businessBranches.id],
    }),
    businessProfile: one(businessProfiles, {
      fields: [businessTvTransactions.businessId],
      references: [businessProfiles.id],
    }),
    staffProfile: one(staffProfiles, {
      fields: [businessTvTransactions.staffId],
      references: [staffProfiles.id],
    }),
  }),
);

export const businessWalletAccountsRelations = relations(
  businessWalletAccounts,
  ({ one }) => ({
    businessProfile: one(businessProfiles, {
      fields: [businessWalletAccounts.businessId],
      references: [businessProfiles.id],
    }),
    businessWallet: one(businessWallets, {
      fields: [businessWalletAccounts.walletId],
      references: [businessWallets.id],
    }),
  }),
);

export const businessWalletsRelations = relations(
  businessWallets,
  ({ one, many }) => ({
    businessWalletAccounts: many(businessWalletAccounts),
    businessProfile: one(businessProfiles, {
      fields: [businessWallets.businessId],
      references: [businessProfiles.id],
    }),
  }),
);

export const businessWalletSnapshotsRelations = relations(
  businessWalletSnapshots,
  ({ one }) => ({
    businessProfile: one(businessProfiles, {
      fields: [businessWalletSnapshots.businessId],
      references: [businessProfiles.id],
    }),
  }),
);

export const dashmeTransactionsRelations = relations(
  dashmeTransactions,
  ({ one }) => ({
    user: one(users, {
      fields: [dashmeTransactions.userId],
      references: [users.id],
    }),
  }),
);

export const dataTransactionsRelations = relations(
  dataTransactions,
  ({ one }) => ({
    user: one(users, {
      fields: [dataTransactions.userId],
      references: [users.id],
    }),
  }),
);

export const deletedAccountsRelations = relations(
  deletedAccounts,
  ({ one }) => ({
    reason: one(reasons, {
      fields: [deletedAccounts.reasonId],
      references: [reasons.id],
    }),
  }),
);

export const reasonsRelations = relations(reasons, ({ many }) => ({
  deletedAccounts: many(deletedAccounts),
}));

export const kycsRelations = relations(kycs, ({ one }) => ({
  documentType: one(documentTypes, {
    fields: [kycs.documentTypeId],
    references: [documentTypes.id],
  }),
  user: one(users, {
    fields: [kycs.userId],
    references: [users.id],
  }),
}));

export const documentTypesRelations = relations(documentTypes, ({ many }) => ({
  kycs: many(kycs),
}));

export const notificationsRelations = relations(notifications, ({ one }) => ({
  user: one(users, {
    fields: [notifications.userId],
    references: [users.id],
  }),
}));

export const otpsRelations = relations(otps, ({ one }) => ({
  user: one(users, {
    fields: [otps.userId],
    references: [users.id],
  }),
}));

export const pinsRelations = relations(pins, ({ one }) => ({
  user: one(users, {
    fields: [pins.userId],
    references: [users.id],
  }),
}));

export const powerTransactionsRelations = relations(
  powerTransactions,
  ({ one }) => ({
    user: one(users, {
      fields: [powerTransactions.userId],
      references: [users.id],
    }),
  }),
);

export const recoveryInfosRelations = relations(recoveryInfos, ({ one }) => ({
  user: one(users, {
    fields: [recoveryInfos.userId],
    references: [users.id],
  }),
}));

export const reportPreferencesRelations = relations(
  reportPreferences,
  ({ one }) => ({
    businessProfile: one(businessProfiles, {
      fields: [reportPreferences.businessId],
      references: [businessProfiles.id],
    }),
  }),
);

export const securityQuestionsRelations = relations(
  securityQuestions,
  ({ one }) => ({
    user: one(users, {
      fields: [securityQuestions.userId],
      references: [users.id],
    }),
  }),
);

export const transactionsRelations = relations(transactions, ({ one }) => ({
  user: one(users, {
    fields: [transactions.userId],
    references: [users.id],
  }),
}));

export const tvTransactionsRelations = relations(tvTransactions, ({ one }) => ({
  user: one(users, {
    fields: [tvTransactions.userId],
    references: [users.id],
  }),
}));

export const userAccountsRelations = relations(userAccounts, ({ one }) => ({
  user: one(users, {
    fields: [userAccounts.userId],
    references: [users.id],
  }),
}));

export const userCardDetailsRelations = relations(
  userCardDetails,
  ({ one }) => ({
    user: one(users, {
      fields: [userCardDetails.userId],
      references: [users.id],
    }),
  }),
);

export const userTokensRelations = relations(userTokens, ({ one }) => ({
  user: one(users, {
    fields: [userTokens.userId],
    references: [users.id],
  }),
}));

export const walletAccountsRelations = relations(walletAccounts, ({ one }) => ({
  wallet: one(wallets, {
    fields: [walletAccounts.walletId],
    references: [wallets.id],
  }),
  user: one(users, {
    fields: [walletAccounts.userId],
    references: [users.id],
  }),
}));

export const walletsRelations = relations(wallets, ({ one, many }) => ({
  walletAccounts: many(walletAccounts),
  user: one(users, {
    fields: [wallets.userId],
    references: [users.id],
  }),
}));
