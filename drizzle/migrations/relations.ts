import { relations } from "drizzle-orm/relations";
import { businessProfiles, businessBranches, businessDataTransactions, staffProfiles } from "./schema";

export const businessBranchesRelations = relations(businessBranches, ({one, many}) => ({
	businessProfile: one(businessProfiles, {
		fields: [businessBranches.businessId],
		references: [businessProfiles.id]
	}),
	businessDataTransactions: many(businessDataTransactions),
}));

export const businessProfilesRelations = relations(businessProfiles, ({many}) => ({
	businessBranches: many(businessBranches),
	businessDataTransactions: many(businessDataTransactions),
}));

export const businessDataTransactionsRelations = relations(businessDataTransactions, ({one}) => ({
	businessBranch: one(businessBranches, {
		fields: [businessDataTransactions.branchId],
		references: [businessBranches.id]
	}),
	businessProfile: one(businessProfiles, {
		fields: [businessDataTransactions.businessId],
		references: [businessProfiles.id]
	}),
	staffProfile: one(staffProfiles, {
		fields: [businessDataTransactions.staffId],
		references: [staffProfiles.id]
	}),
}));

export const staffProfilesRelations = relations(staffProfiles, ({many}) => ({
	businessDataTransactions: many(businessDataTransactions),
}));