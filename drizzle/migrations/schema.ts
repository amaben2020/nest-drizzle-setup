import {
  mysqlTable,
  mysqlSchema,
  AnyMySqlColumn,
  primaryKey,
  bigint,
  varchar,
  datetime,
  index,
  foreignKey,
  unique,
  decimal,
  mysqlEnum,
  int,
  tinyint,
  serial,
  text,
  timestamp,
  date,
  check,
} from 'drizzle-orm/mysql-core';
import { sql } from 'drizzle-orm';

export const accessibilities = mysqlTable(
  'accessibilities',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    accessDaemon: varchar('access_daemon', { length: 1000 }),
    refDaemon: varchar('ref_daemon', { length: 1000 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'accessibilities_id' })],
);

export const adeptAccess = mysqlTable(
  'adept_access',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    accessToken: varchar('access_token', { length: 1000 }),
    ttl: datetime({ mode: 'string' }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'adept_access_id' })],
);

export const airtimeProviders = mysqlTable(
  'airtime_providers',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 20 }).notNull(),
    slug: varchar({ length: 20 }).notNull(),
    image: varchar({ length: 200 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'airtime_providers_id' }),
  ],
);

export const airtimeTransactions = mysqlTable(
  'airtime_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true })
      .notNull()
      .references(() => users.id),
    provider: varchar({ length: 80 }).notNull(),
    receiver: varchar({ length: 25 }).notNull(),
    amount: decimal({ precision: 12, scale: 2, unsigned: true }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    phone: varchar({ length: 15 }),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    status: mysqlEnum(['pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
    balanceBefore: decimal('balance_before', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    balanceAfter: decimal('balance_after', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
  },
  (table) => [
    index('idx_receiver').on(table.receiver),
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'airtime_transactions_id' }),
    unique('unq_airtime_txn').on(table.transactionId, table.userId),
  ],
);

export const appSettings = mysqlTable(
  'app_settings',
  {
    id: int({ unsigned: true }).autoincrement().notNull(),
    smsPlatform: mysqlEnum('sms_platform', ['termii', 'sendchamp']).notNull(),
    verificationPlatform: mysqlEnum('verification_platform', ['dojah', 'mono'])
      .default('dojah')
      .notNull(),
    paymentPlatform: mysqlEnum('payment_platform', [
      'flutterwave',
      'paystack',
      'irecharge',
    ]).notNull(),
    minimumAmount: decimal('minimum_amount', { precision: 8, scale: 0 }),
    irchgTokenTtl: datetime('irchg_token_ttl', { mode: 'string' }),
    irchgChargeRate: decimal('irchg_charge_rate', { precision: 5, scale: 0 })
      .default('50')
      .notNull(),
    irchgTokenLogin: varchar('irchg_token_login', { length: 60 }),
    minimumAmountToPhone: decimal('minimum_amount_to_phone', {
      precision: 8,
      scale: 2,
    })
      .default('200.00')
      .notNull(),
    withdrawalChargeRate: decimal('withdrawal_charge_rate', {
      precision: 8,
      scale: 0,
    })
      .default('20')
      .notNull(),
    createdAt: datetime({ mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    noKycMaxAmount: decimal('no_kyc_max_amount', { precision: 8, scale: 2 })
      .default('20000.00')
      .notNull(),
    basicTransferAmount: decimal('basic_transfer_amount', {
      precision: 10,
      scale: 2,
    })
      .default('20000.00')
      .notNull(),
    intermediateTransferAmount: decimal('intermediate_transfer_amount')
      .default('5000000')
      .notNull(),
    minAmountToPhone: decimal('min_amount_to_phone', {
      precision: 10,
      scale: 2,
    })
      .default('200.00')
      .notNull(),
    minAmountToWallet: decimal('min_amount_to_wallet', {
      precision: 10,
      scale: 2,
    })
      .default('100.00')
      .notNull(),
    nonBlueChargeRate: decimal('non_blue_charge_rate', {
      precision: 10,
      scale: 2,
    })
      .default('50.00')
      .notNull(),
    blueChargeRate: decimal('blue_charge_rate', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    minWithdrawalAmount: varchar('min_withdrawal_amount', { length: 255 }),
    adeptToken: varchar('adept_token', { length: 1000 }),
    adeptTokenTtl: datetime('adept_token_ttl', { mode: 'string' }),
    powerPlatform: mysqlEnum('power_platform', [
      'irecharge',
      'vtpass',
      'buypower',
    ]).notNull(),
    airtimePlatform: mysqlEnum('airtime_platform', [
      'irecharge',
      'vtpass',
      'buypower',
    ]).notNull(),
    dataPlatform: mysqlEnum('data_platform', [
      'irecharge',
      'vtpass',
      'buypower',
    ]).notNull(),
    tvPlatform: mysqlEnum('tv_platform', [
      'irecharge',
      'vtpass',
      'buypower',
    ]).notNull(),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'app_settings_id' }),
    unique('UQ_4800b266ba790931744b3e53a74').on(table.id),
  ],
);

export const banks = mysqlTable(
  'banks',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    code: varchar({ length: 20 }).notNull(),
    bankCode: varchar('bank_code', { length: 20 }),
    name: varchar({ length: 150 }).notNull(),
    logoUrl: varchar('logo_url', { length: 100 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'banks_id' })],
);

export const beneficiaries = mysqlTable(
  'beneficiaries',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    beneficiaryId: bigint('beneficiary_id', { mode: 'number', unsigned: true }),
    identifier: varchar({ length: 50 }).notNull(),
    type: mysqlEnum(['phone', 'blue-user']).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    businessBeneficiary: bigint('business_beneficiary', { mode: 'number' }),
    name: varchar({ length: 255 }),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
  },
  (table) => [
    index('beneficiary_id').on(table.beneficiaryId),
    index('idx_business_id').on(table.businessId),
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'beneficiaries_id' }),
  ],
);

export const billMatesFavourites = mysqlTable(
  'bill_mates_favourites',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).references(
      () => users.id,
      { onDelete: 'cascade' },
    ),
    providerId: bigint('provider_id', { mode: 'number', unsigned: true }),
    providerType: mysqlEnum('provider_type', [
      'power_providers',
      'data_providers',
      'tv_providers',
      'airtime_providers',
    ]).notNull(),
    receiver: varchar({ length: 150 }).notNull(),
    name: varchar({ length: 255 }).notNull(),
    slug: varchar({ length: 255 }),
    state: varchar({ length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    meterCategory: varchar('meter_category', { length: 100 }),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'bill_mates_favourites_id' }),
  ],
);

export const billMatesTransactions = mysqlTable(
  'bill_mates_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    amount: decimal({ precision: 15, scale: 2, unsigned: true }).notNull(),
    status: mysqlEnum([
      'successful',
      'pending',
      'failed',
      'in-progress',
      'processing',
    ]).notNull(),
    type: mysqlEnum(['airtime', 'data', 'cable-tv', 'power']).notNull(),
    provider: varchar({ length: 255 }),
    package: varchar({ length: 255 }),
    transactionReference: varchar('transaction_reference', { length: 20 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    receiver: varchar({ length: 25 }),
  },
  (table) => [
    index('idx_created_at').on(table.createdAt),
    index('idx_status').on(table.status),
    index('idx_transaction_reference').on(table.transactionReference),
    index('idx_type').on(table.type),
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'bill_mates_transactions_id' }),
  ],
);

export const blueAdminRoles = mysqlTable(
  'blue_admin_roles',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 50 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'blue_admin_roles_id' })],
);

export const blueAdmins = mysqlTable(
  'blue_admins',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    firstName: varchar('first_name', { length: 100 }).notNull(),
    lastName: varchar('last_name', { length: 100 }).notNull(),
    email: varchar({ length: 255 }).notNull(),
    password: varchar({ length: 255 }).notNull(),
    displayPicture: varchar('display_picture', { length: 255 }),
    passwordChangedAt: varchar('password_changed_at', { length: 30 }),
    role: varchar({ length: 20 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'blue_admins_id' })],
);

export const businessBranches = mysqlTable(
  'business_branches',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    name: varchar({ length: 150 }),
    staffSize: varchar('staff_size', { length: 20 }),
    location: varchar({ length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    isActive: tinyint('is_active').default(1).notNull(),
  },
  (table) => [
    index('business_id').on(table.businessId),
    primaryKey({ columns: [table.id], name: 'business_branches_id' }),
  ],
);

export const businessCategories = mysqlTable(
  'business_categories',
  {
    id: int().notNull(),
    title: varchar({ length: 200 }).notNull(),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_categories_id' }),
    unique('UQ_d10a707dfd0ca189233999204e5').on(table.id),
  ],
);

export const businessDataTransactions = mysqlTable(
  'business_data_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    branchId: bigint('branch_id', { mode: 'number', unsigned: true }),
    staffId: bigint('staff_id', { mode: 'number', unsigned: true }),
    receiver: varchar({ length: 20 }).notNull(),
    provider: varchar({ length: 15 }).notNull(),
    package: varchar({ length: 100 }).notNull(),
    amount: decimal({ precision: 12, scale: 2 }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    customerInfo: varchar('customer_info', { length: 100 }),
    customerName: varchar('customer_name', { length: 100 }),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    status: mysqlEnum(['pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    phone: varchar({ length: 15 }),
    providerSlug: varchar('provider_slug', { length: 30 }),
    accessToken: varchar('access_token', { length: 40 }),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    code: varchar({ length: 10 }),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_data_transactions_id' }),
  ],
);

export const businessDevices = mysqlTable(
  'business_devices',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    fcmToken: varchar('fcm_token', { length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'business_devices_id' })],
);

export const businessFees = mysqlTable(
  'business_fees',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    withdrawal: decimal({ precision: 10, scale: 2 }).notNull(),
    billPayment: decimal('bill_payment', { precision: 10, scale: 2 }).notNull(),
    transfers: decimal({ precision: 10, scale: 2 }).notNull(),
    blueToBlue: decimal('blue_to_blue', { precision: 10, scale: 2 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'business_fees_id' })],
);

export const businessOnboardingForms = mysqlTable(
  'business_onboarding_forms',
  {
    id: serial().notNull(),
    businessName: varchar('business_name', { length: 255 }).notNull(),
    businessType: varchar('business_type', { length: 255 }).notNull(),
    businessCategory: varchar('business_category', { length: 255 }).notNull(),
    businessAddress: text('business_address').notNull(),
    state: varchar({ length: 100 }).notNull(),
    branchCount: varchar('branch_count', { length: 50 }).notNull(),
    businessWebsite: varchar('business_website', { length: 255 }),
    contactName: varchar('contact_name', { length: 255 }).notNull(),
    contactRole: varchar('contact_role', { length: 100 }).notNull(),
    contactPhone: varchar('contact_phone', { length: 20 }).notNull(),
    contactEmail: varchar('contact_email', { length: 255 }),
    acceptsDigitalPayments: tinyint('accepts_digital_payments')
      .default(0)
      .notNull(),
    paymentTools: text('payment_tools').notNull(),
    monthlyTransactions: varchar('monthly_transactions', {
      length: 100,
    }).notNull(),
    employeeCount: varchar('employee_count', { length: 50 }),
    setupNeeds: text('setup_needs').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default(sql`(now())`)
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default(sql`(now())`)
      .notNull(),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_onboarding_forms_id' }),
    unique('id').on(table.id),
  ],
);

export const businessPaymentTransactions = mysqlTable(
  'business_payment_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    branchId: bigint('branch_id', { mode: 'number', unsigned: true }),
    staffId: bigint('staff_id', { mode: 'number', unsigned: true }),
    amount: decimal({ precision: 15, scale: 2 }),
    narration: varchar({ length: 255 }),
    orderReference: varchar('order_reference', { length: 50 }),
    receiverName: varchar('receiver_name', { length: 250 }),
    senderName: varchar('sender_name', { length: 200 }),
    receiverWallet: varchar('receiver_wallet', { length: 20 }),
    clientUsed: mysqlEnum('client_used', ['desktop', 'mobile']).default(
      'mobile',
    ),
    dueDate: datetime('due_date', { mode: 'string' }),
    paymentMode: mysqlEnum('payment_mode', [
      'blue-user',
      'phone',
      'offline',
      'withdrawal',
      'wallet_topup',
      'card',
      'bank_transfer',
    ]).notNull(),
    status: mysqlEnum([
      'in-progress',
      'pending',
      'successful',
      'failed',
      'reversed',
    ])
      .default('pending')
      .notNull(),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    verificationRequest: varchar('verification_request', { length: 1000 }),
    verificationResponse: varchar('verification_response', { length: 1000 }),
    serviceCharge: decimal('service_charge', {
      precision: 10,
      scale: 2,
    }).default('0.00'),
    email: varchar({ length: 300 }),
    requestBody: varchar('request_body', { length: 1000 }),
    responseBody: varchar('response_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    receiverType: mysqlEnum('receiver_type', [
      'personal',
      'business',
      'business-personal',
    ]),
    sentBy: varchar('sent_by', { length: 20 }),
  },
  (table) => [
    primaryKey({
      columns: [table.id],
      name: 'business_payment_transactions_id',
    }),
    unique('unique_bus_transaction').on(table.transactionId, table.businessId),
  ],
);

export const businessPins = mysqlTable(
  'business_pins',
  {
    id: int().autoincrement().notNull(),
    businessId: bigint('business_id', {
      mode: 'number',
      unsigned: true,
    }).notNull(),
    passcode: varchar({ length: 255 }),
    createdAt: datetime('created_at', { mode: 'string', fsp: 6 })
      .default(sql`(CURRENT_TIMESTAMP(6))`)
      .notNull(),
    updatedAt: datetime('updated_at', { mode: 'string', fsp: 6 })
      .default(sql`(CURRENT_TIMESTAMP(6))`)
      .notNull(),
    resetPinStatus: tinyint('reset_pin_status').default(0),
  },
  (table) => [
    index('business_id').on(table.businessId),
    primaryKey({ columns: [table.id], name: 'business_pins_id' }),
  ],
);

export const businessPowerTransactions = mysqlTable(
  'business_power_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    branchId: bigint('branch_id', { mode: 'number', unsigned: true }),
    staffId: bigint('staff_id', { mode: 'number', unsigned: true }),
    meterType: mysqlEnum('meter_type', ['prepaid', 'postpaid']).notNull(),
    receiver: varchar({ length: 15 }).notNull(),
    provider: varchar({ length: 80 }).notNull(),
    amount: decimal({ precision: 12, scale: 2 }),
    units: varchar({ length: 20 }),
    token: varchar({ length: 30 }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    customerInfo: varchar('customer_info', { length: 100 }),
    customerName: varchar('customer_name', { length: 100 }),
    meterCategory: mysqlEnum('meter_category', ['MD', 'NON-MD']),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    status: mysqlEnum(['pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    accessToken: varchar('access_token', { length: 40 }),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    phone: varchar({ length: 15 }),
    slug: varchar({ length: 30 }),
    minimumAmount: varchar('minimum_amount', { length: 20 }),
    serviceCharge: decimal('service_charge', {
      precision: 10,
      scale: 2,
    }).default('100.00'),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    kct1: varchar('kct_1', { length: 100 }),
    kct2: varchar('kct_2', { length: 100 }),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_power_transactions_id' }),
  ],
);

export const businessProfiles = mysqlTable(
  'business_profiles',
  {
    id: serial().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    name: varchar({ length: 255 }),
    description: varchar({ length: 255 }),
    staffSizeMin: int('staff_size_min'),
    staffSizeMax: int('staff_size_max'),
    logo: varchar({ length: 255 }),
    state: varchar({ length: 50 }),
    address: varchar({ length: 255 }),
    city: varchar({ length: 50 }),
    lga: varchar({ length: 80 }),
    level: int().default(0).notNull(),
    createdAt: datetime('created_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    cacNumber: varchar('cac_number', { length: 50 }),
    staffSize: varchar('staff_size', { length: 100 }),
    bUserId: bigint('b_user_id', { mode: 'number', unsigned: true }),
    bvn: varchar({ length: 20 }),
    category: varchar({ length: 100 }).notNull(),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_profiles_id' }),
    unique('UQ_29525485b1db8e87caf6a5ef042').on(table.id),
  ],
);

export const businessRecoveryInfos = mysqlTable(
  'business_recovery_infos',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    recoveryCode: varchar('recovery_code', { length: 40 }),
    recoveryPhone: varchar('recovery_phone', { length: 20 }),
    createdAt: datetime('created_at', { mode: 'string' }),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    businessId: bigint('business_id', { mode: 'number' }).notNull(),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'business_recovery_infos_id' }),
  ],
);

export const businessSecurityQuestions = mysqlTable(
  'business_security_questions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    createdAt: datetime('created_at', { mode: 'string' }),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    question: varchar({ length: 200 }).notNull(),
    answer: varchar({ length: 200 }).notNull(),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_security_questions_id' }),
  ],
);

export const businessSettlementAccounts = mysqlTable(
  'business_settlement_accounts',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    bankId: bigint('bank_id', { mode: 'number' }),
    accountNumber: varchar('account_number', { length: 20 }),
    accountName: varchar('account_name', { length: 255 }),
    bankName: varchar('bank_name', { length: 200 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({
      columns: [table.id],
      name: 'business_settlement_accounts_id',
    }),
    unique('unique_business_id').on(table.businessId),
  ],
);

export const businessShareholders = mysqlTable(
  'business_shareholders',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', {
      mode: 'number',
      unsigned: true,
    }).notNull(),
    name: varchar({ length: 255 }).notNull(),
    address: varchar({ length: 255 }),
    phone: varchar({ length: 255 }),
    dateOfBirth: varchar('date_of_birth', { length: 255 }),
    bvn: varchar({ length: 25 }),
    verified: tinyint({ unsigned: true }).default(0),
    designation: varchar({ length: 100 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('business_id').on(table.businessId),
    primaryKey({ columns: [table.id], name: 'business_shareholders_id' }),
  ],
);

export const businessTransactionHistories = mysqlTable(
  'business_transaction_histories',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    branchId: bigint('branch_id', { mode: 'number', unsigned: true }),
    staffId: bigint('staff_id', { mode: 'number', unsigned: true }),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    receiverName: varchar('receiver_name', { length: 100 }),
    senderName: varchar('sender_name', { length: 100 }),
    amount: decimal({ precision: 15, scale: 2 }).notNull(),
    status: mysqlEnum([
      'successful',
      'pending',
      'failed',
      'in-progress',
    ]).notNull(),
    paymentMode: mysqlEnum('payment_mode', [
      'blue-user',
      'phone',
      'offline',
      'withdrawal',
      'card',
      'bank_transfer',
      'airtime',
      'data',
      'power',
      'cable-tv',
    ]).notNull(),
    type: mysqlEnum(['credit', 'debit']).notNull(),
    clientUsed: mysqlEnum('client_used', ['desktop', 'mobile'])
      .default('mobile')
      .notNull(),
    serviceCharge: decimal('service_charge', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    createdAt: datetime('created_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    balanceBefore: decimal('balance_before', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    balanceAfter: decimal('balance_after', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
  },
  (table) => [
    index('fk_txnhistory_branch_id').on(table.branchId),
    index('fk_txnhistory_staff_id').on(table.staffId),
    index('idx_business_id').on(table.businessId),
    index('idx_created_at').on(table.createdAt),
    index('idx_payment_mode').on(table.paymentMode),
    index('idx_status').on(table.status),
    index('idx_transaction_reference').on(table.transactionId),
    primaryKey({
      columns: [table.id],
      name: 'business_transaction_histories_id',
    }),
  ],
);

export const businessTvTransactions = mysqlTable(
  'business_tv_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    branchId: bigint('branch_id', { mode: 'number', unsigned: true }),
    staffId: bigint('staff_id', { mode: 'number', unsigned: true }),
    receiver: varchar({ length: 25 }).notNull(),
    provider: varchar({ length: 80 }).notNull(),
    package: varchar({ length: 80 }).notNull(),
    amount: decimal({ precision: 12, scale: 2 }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    customerInfo: varchar('customer_info', { length: 100 }),
    customerName: varchar('customer_name', { length: 100 }),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    status: mysqlEnum(['pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    accessToken: varchar('access_token', { length: 40 }),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    phone: varchar({ length: 15 }),
    code: varchar({ length: 30 }),
    serviceCharge: decimal('service_charge', {
      precision: 10,
      scale: 2,
    }).default('100.00'),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_tv_transactions_id' }),
  ],
);

export const businessUsers = mysqlTable(
  'business_users',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    phone: varchar({ length: 50 }).notNull(),
    displayPicture: varchar('display_picture', { length: 1000 }),
    isDeleted: tinyint('is_deleted', { unsigned: true }).default(0),
    flagged: tinyint().default(0).notNull(),
    verified: tinyint({ unsigned: true }).default(0),
    level: int().default(1),
    notificationStatus: tinyint('notification_status', {
      unsigned: true,
    }).default(0),
    resetCredentialStatus: tinyint('reset_credential_status', {
      unsigned: true,
    }).default(0),
    password: varchar({ length: 255 }),
    passwordChangedAt: varchar('password_changed_at', { length: 255 }),
    kyc: mysqlEnum(['basic', 'intermediate', 'pro']).default('basic').notNull(),
    businessProfileCompleted: tinyint('business_profile_completed', {
      unsigned: true,
    }).default(0),
    businessDetailsCompleted: tinyint('business_details_completed', {
      unsigned: true,
    }).default(0),
    businessKycCompleted: tinyint('business_kyc_completed', {
      unsigned: true,
    }).default(0),
    proofOfAddressVerified: tinyint('proof_of_address_verified', {
      unsigned: true,
    }).default(0),
    autoWithdrawalEnabled: tinyint('auto_withdrawal_enabled', {
      unsigned: true,
    }).default(0),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_users_id' }),
    unique('idx_phone_191uuwqwmc12').on(table.phone),
    unique('phone').on(table.phone),
  ],
);

export const businessWalletAccounts = mysqlTable(
  'business_wallet_accounts',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', {
      mode: 'number',
      unsigned: true,
    }).notNull(),
    walletId: bigint('wallet_id', { mode: 'number', unsigned: true }).notNull(),
    status: tinyint({ unsigned: true }).default(0).notNull(),
    accountNumber: varchar('account_number', { length: 50 }),
    accountName: varchar('account_name', { length: 50 }),
    bankName: varchar('bank_name', { length: 250 }),
    referenceNumber: varchar('reference_number', { length: 100 }).notNull(),
    requestBody: varchar('request_body', { length: 1000 }),
    responseBody: varchar('response_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('business_id').on(table.businessId),
    index('wallet_id').on(table.walletId),
    primaryKey({ columns: [table.id], name: 'business_wallet_accounts_id' }),
  ],
);

export const businessWalletSnapshots = mysqlTable(
  'business_wallet_snapshots',
  {
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    type: mysqlEnum(['credit', 'debit']).notNull(),
    createdAt: datetime('created_at', { mode: 'string', fsp: 6 })
      .default(sql`(CURRENT_TIMESTAMP(6))`)
      .notNull(),
    updatedAt: datetime('updated_at', { mode: 'string', fsp: 6 })
      .default(sql`(CURRENT_TIMESTAMP(6))`)
      .notNull(),
    id: int().autoincrement().notNull(),
    transactionId: varchar('transaction_id', { length: 20 }).notNull(),
    walletId: int('wallet_id').notNull(),
    amount: decimal({ precision: 12, scale: 2 }),
    balanceBefore: decimal('balance_before', { precision: 12, scale: 2 }),
    balanceAfter: decimal('balance_after', { precision: 12, scale: 2 }),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'business_wallet_snapshots_id' }),
    unique('unique_bus_snapshot').on(table.transactionId, table.businessId),
  ],
);

export const businessWallets = mysqlTable(
  'business_wallets',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    businessId: bigint('business_id', {
      mode: 'number',
      unsigned: true,
    }).notNull(),
    balance: decimal({ precision: 15, scale: 2 }).default('0.00').notNull(),
    walletId: varchar('wallet_id', { length: 20 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string', fsp: 6 })
      .default(sql`(CURRENT_TIMESTAMP(6))`)
      .notNull(),
    updatedAt: datetime('updated_at', { mode: 'string', fsp: 6 })
      .default(sql`(CURRENT_TIMESTAMP(6))`)
      .notNull(),
    walletCode: varchar('wallet_code', { length: 20 }).notNull(),
  },
  (table) => [
    index('business_id').on(table.businessId),
    primaryKey({ columns: [table.id], name: 'business_wallets_id' }),
    unique('IDX_ff06839ff828223b3e3d33c2').on(table.walletId),
  ],
);

export const dashmeIdempotencyRecords = mysqlTable(
  'dashme_idempotency_records',
  {
    id: int().autoincrement().notNull(),
    transactionId: varchar('transaction_id', { length: 255 }).notNull(),
    userId: int('user_id').notNull(),
    operationType: varchar('operation_type', { length: 50 }).notNull(),
    responseData: text('response_data').notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
  },
  (table) => [
    index('created_at').on(table.createdAt),
    index('transaction_id').on(
      table.transactionId,
      table.userId,
      table.operationType,
    ),
    primaryKey({ columns: [table.id], name: 'dashme_idempotency_records_id' }),
  ],
);

export const dashmeTransactions = mysqlTable(
  'dashme_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    amount: decimal({ precision: 15, scale: 2 }).notNull(),
    orderReference: varchar('order_reference', { length: 50 }),
    transactionId: varchar('transaction_id', { length: 20 }),
    receiverId: bigint('receiver_id', { mode: 'number', unsigned: true }),
    receiverName: varchar('receiver_name', { length: 250 }),
    receiverWallet: varchar('receiver_wallet', { length: 20 }),
    senderWallet: varchar('sender_wallet', { length: 300 }),
    senderName: varchar('sender_name', { length: 250 }),
    paymentMode: mysqlEnum('payment_mode', ['blue-user', 'phone']).notNull(),
    dueDate: datetime('due_date', { mode: 'string' }),
    status: mysqlEnum(['pending', 'sent', 'successful', 'failed', 'reversed'])
      .default('pending')
      .notNull(),
    serviceCharge: decimal('service_charge', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    narration: varchar({ length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    dueAt: datetime('due_at', { mode: 'string' }).notNull(),
  },
  (table) => [
    index('idx_created_at').on(table.createdAt),
    index('idx_payment_mode').on(table.paymentMode),
    index('idx_status').on(table.status),
    index('receiver_id').on(table.receiverId),
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'dashme_transactions_id' }),
    unique('idx_transaction_id').on(table.transactionId),
    unique('unique_transaction').on(table.transactionId, table.userId),
  ],
);

export const dashmeTransactionsAttemptLogs = mysqlTable(
  'dashme_transactions_attempt_logs',
  {
    id: int().autoincrement().notNull(),
    userId: int('user_id').notNull(),
    transactionId: varchar('transaction_id', { length: 255 }).notNull(),
    action: mysqlEnum(['accept', 'decline', 'initiate', 'confirm']).notNull(),
    ipAddress: varchar('ip_address', { length: 45 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
  },
  (table) => [
    index('user_id').on(table.userId, table.action, table.createdAt),
    primaryKey({
      columns: [table.id],
      name: 'dashme_transactions_attempt_logs_id',
    }),
  ],
);

export const dataPackages = mysqlTable(
  'data_packages',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    code: varchar({ length: 20 }).notNull(),
    name: varchar({ length: 100 }).notNull(),
    amount: decimal({ precision: 12, scale: 2 }).default('0.00').notNull(),
    validity: varchar({ length: 100 }),
    provider: varchar({ length: 10 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    providerSlug: varchar('provider_slug', { length: 10 }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'data_packages_id' })],
);

export const dataProviders = mysqlTable(
  'data_providers',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 20 }).notNull(),
    slug: varchar({ length: 20 }).notNull(),
    image: varchar({ length: 200 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'data_providers_id' })],
);

export const dataTransactions = mysqlTable(
  'data_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    receiver: varchar({ length: 25 }).notNull(),
    provider: varchar({ length: 80 }).notNull(),
    package: varchar({ length: 300 }).notNull(),
    amount: decimal({ precision: 12, scale: 2, unsigned: true }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    customerInfo: varchar('customer_info', { length: 100 }),
    customerName: varchar('customer_name', { length: 100 }),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    status: mysqlEnum(['pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    phone: varchar({ length: 15 }),
    providerSlug: varchar('provider_slug', { length: 30 }),
    accessToken: varchar('access_token', { length: 40 }),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    code: varchar({ length: 10 }),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
    balanceBefore: decimal('balance_before', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    balanceAfter: decimal('balance_after', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
  },
  (table) => [
    index('idx_receiver').on(table.receiver),
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'data_transactions_id' }),
    unique('unq_airtime_txn').on(table.transactionId, table.userId),
  ],
);

export const deletedAccounts = mysqlTable(
  'deleted_accounts',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    reasonId: bigint('reason_id', { mode: 'number', unsigned: true }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('reason_id').on(table.reasonId),
    primaryKey({ columns: [table.id], name: 'deleted_accounts_id' }),
  ],
);

export const documentTypes = mysqlTable(
  'document_types',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 50 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'document_types_id' })],
);

export const flaggedUsers = mysqlTable(
  'flagged_users',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    type: mysqlEnum(['personal', 'business']).notNull(),
    reason: text().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    adminId: bigint('admin_id', { mode: 'number', unsigned: true }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'flagged_users_id' }),
  ],
);

export const irchgBanks = mysqlTable(
  'irchg_banks',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    code: varchar({ length: 20 }).notNull(),
    bankCode: varchar('bank_code', { length: 20 }),
    name: varchar({ length: 150 }).notNull(),
    logoUrl: varchar('logo_url', { length: 100 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'irchg_banks_id' })],
);

export const irechargeDataPackages = mysqlTable(
  'irecharge_data_packages',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    code: varchar({ length: 20 }).notNull(),
    title: varchar({ length: 100 }).notNull(),
    validity: varchar({ length: 100 }),
    price: decimal({ precision: 12, scale: 2, unsigned: true })
      .default('0.00')
      .notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'irecharge_data_packages_id' }),
  ],
);

export const irechargePowerProviders = mysqlTable(
  'irecharge_power_providers',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    description: varchar({ length: 100 }).notNull(),
    slug: varchar({ length: 15 }).notNull(),
    code: varchar({ length: 100 }).notNull(),
    minimumValue: decimal('minimum_value', {
      precision: 12,
      scale: 2,
      unsigned: true,
    }).default('0.00'),
    maximumValue: decimal('maximum_value', {
      precision: 12,
      scale: 2,
      unsigned: true,
    }).default('0.00'),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'irecharge_power_providers_id' }),
  ],
);

export const irechargeTvPackages = mysqlTable(
  'irecharge_tv_packages',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    title: varchar({ length: 100 }).notNull(),
    network: varchar({ length: 15 }).notNull(),
    price: decimal({ precision: 12, scale: 2, unsigned: true }).default('0.00'),
    code: varchar({ length: 100 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'irecharge_tv_packages_id' }),
  ],
);

export const kycs = mysqlTable(
  'kycs',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    documentTypeId: bigint('document_type_id', {
      mode: 'number',
      unsigned: true,
    }),
    bvn: varchar({ length: 50 }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    dateOfBirth: date('date_of_birth', { mode: 'string' }).notNull(),
    country: varchar({ length: 50 }),
    frontCover: varchar('front_cover', { length: 300 }),
    backCover: varchar('back_cover', { length: 300 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    documents: varchar({ length: 3000 }),
  },
  (table) => [
    index('document_type_id').on(table.documentTypeId),
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'kycs_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const migrations = mysqlTable(
  'migrations',
  {
    id: int().autoincrement().notNull(),
    timestamp: bigint({ mode: 'number' }).notNull(),
    name: varchar({ length: 255 }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'migrations_id' })],
);

export const notifications = mysqlTable(
  'notifications',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    status: tinyint({ unsigned: true }).default(0),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'notifications_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const otps = mysqlTable(
  'otps',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    code: varchar({ length: 10 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'otps_id' }),
  ],
);

export const paymentLinks = mysqlTable(
  'payment_links',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    transactionId: varchar('transaction_id', { length: 20 }).notNull(),
    urlCode: varchar('url_code', { length: 20 }).notNull(),
    originalUrl: varchar('original_url', { length: 255 }).notNull(),
    amount: decimal({ precision: 15, scale: 2 }),
    phone: varchar({ length: 20 }),
    senderName: varchar('sender_name', { length: 300 }),
    verifiedAccount: tinyint('verified_account').default(0),
    clicked: tinyint({ unsigned: true }).default(0),
    status: mysqlEnum([
      'failed',
      'sent',
      'processing',
      'fulfilled',
      'cancelled',
      'withdrawn',
      'reversed',
    ]).default('sent'),
    platformUsed: varchar('platform_used', { length: 20 }),
    receiverName: varchar('receiver_name', { length: 255 }),
    batch: varchar({ length: 120 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    apiResponse: varchar('api_response', { length: 1500 }),
    accountNumber: varchar('account_number', { length: 15 }),
    bank: varchar({ length: 60 }),
    reference: varchar({ length: 20 }),
    recipientCode: varchar('recipient_code', { length: 20 }),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
    narration: varchar({ length: 255 }),
    type: mysqlEnum(['personal', 'business']).default('personal').notNull(),
    requestBody: varchar('request_body', { length: 10000 }),
    responseBody: varchar('response_body', { length: 10000 }),
    idempotencyKey: varchar('idempotency_key', { length: 100 }),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'payment_links_id' })],
);

export const payments = mysqlTable(
  'payments',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    transactionId: varchar('transaction_id', { length: 20 }).notNull(),
    amount: decimal({ precision: 15, scale: 2 }).notNull(),
    responseBody: varchar('response_body', { length: 1000 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    accountNumber: varchar('account_number', { length: 12 }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'payments_id' })],
);

export const paystackBanks = mysqlTable(
  'paystack_banks',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    code: varchar({ length: 20 }).notNull(),
    bankCode: varchar('bank_code', { length: 20 }),
    name: varchar({ length: 150 }).notNull(),
    logoUrl: varchar('logo_url', { length: 100 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'paystack_banks_id' })],
);

export const pilotTesters = mysqlTable(
  'pilot_testers',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    firstName: varchar('first_name', { length: 50 }).notNull(),
    lastName: varchar('last_name', { length: 50 }).notNull(),
    email: varchar({ length: 150 }).notNull(),
    phone: varchar({ length: 20 }).notNull(),
    platform: text().notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'pilot_testers_id' }),
    unique('email').on(table.email),
    unique('phone').on(table.phone),
  ],
);

export const pins = mysqlTable(
  'pins',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    passcode: varchar({ length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'pins_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const powerProviders = mysqlTable(
  'power_providers',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 80 }).notNull(),
    slug: varchar({ length: 10 }).notNull(),
    locations: varchar({ length: 255 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'power_providers_id' })],
);

export const powerTransactions = mysqlTable(
  'power_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    meterType: mysqlEnum('meter_type', ['prepaid', 'postpaid']).notNull(),
    receiver: varchar({ length: 25 }).notNull(),
    provider: varchar({ length: 80 }).notNull(),
    amount: decimal({ precision: 12, scale: 2, unsigned: true }),
    units: varchar({ length: 20 }),
    token: varchar({ length: 30 }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    customerInfo: varchar('customer_info', { length: 100 }),
    customerName: varchar('customer_name', { length: 100 }),
    meterCategory: mysqlEnum('meter_category', ['MD', 'NON-MD']),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    status: mysqlEnum(['pending', 'successful', 'failed', 'processing'])
      .default('pending')
      .notNull(),
    accessToken: varchar('access_token', { length: 40 }),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    phone: varchar({ length: 15 }),
    slug: varchar({ length: 30 }),
    minimumAmount: varchar('minimum_amount', { length: 20 }),
    serviceCharge: decimal('service_charge', {
      precision: 10,
      scale: 2,
    }).default('100.00'),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    kct1: varchar('kct_1', { length: 100 }),
    kct2: varchar('kct_2', { length: 100 }),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
    balanceBefore: decimal('balance_before', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    balanceAfter: decimal('balance_after', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
  },
  (table) => [
    index('idx_meter_type').on(table.meterType),
    index('idx_receiver').on(table.receiver),
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'power_transactions_id' }),
    unique('unq_airtime_txn').on(table.transactionId, table.userId),
  ],
);

export const reasons = mysqlTable(
  'reasons',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    content: varchar({ length: 50 }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'reasons_id' })],
);

export const recoveryInfos = mysqlTable(
  'recovery_infos',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    recoveryCode: varchar('recovery_code', { length: 255 }),
    recoveryPhone: varchar('recovery_phone', { length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'recovery_infos_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const reportPreferences = mysqlTable(
  'report_preferences',
  {
    id: int().autoincrement().notNull(),
    businessId: bigint('business_id', {
      mode: 'number',
      unsigned: true,
    }).notNull(),
    email: varchar({ length: 255 }).notNull(),
    isActive: tinyint('is_active').default(1).notNull(),
    scheduleTime: varchar('schedule_time', { length: 10 })
      .default('23:00')
      .notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default(sql`(now())`)
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default(sql`(now())`)
      .onUpdateNow()
      .notNull(),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'report_preferences_id' }),
    unique('UQ_8bd9422c2c9e0ca8ab0df102c5e').on(table.id),
  ],
);

export const securityQuestions = mysqlTable(
  'security_questions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    question: varchar({ length: 200 }).notNull(),
    answer: varchar({ length: 200 }).notNull(),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'security_questions_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const smsLogs = mysqlTable(
  'sms_logs',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    requestBody: varchar('request_body', { length: 1000 }),
    responseBody: varchar('response_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'sms_logs_id' })],
);

export const staffProfiles = mysqlTable(
  'staff_profiles',
  {
    id: serial().notNull(),
    userId: bigint('user_id', { mode: 'number' }),
    name: varchar({ length: 255 }).notNull(),
    phone: varchar({ length: 150 }).notNull(),
    password: varchar({ length: 200 }).notNull(),
    passwordChangedAt: varchar('password_changed_at', { length: 50 }),
    isActive: tinyint('is_active').default(1).notNull(),
    createdAt: datetime('created_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
    ownerId: bigint('owner_id', { mode: 'number' }),
    role: mysqlEnum(['admin', 'cashier']).notNull(),
    branchId: bigint('branch_id', { mode: 'number', unsigned: true }),
    displayPicture: varchar('display_picture', { length: 255 }),
    branchName: varchar('branch_name', { length: 255 }),
    businessId: bigint('business_id', { mode: 'number', unsigned: true }),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'staff_profiles_id' }),
    unique('UQ_6d4c6c0b447e39147b4a6dcbede').on(table.id),
  ],
);

export const staffRoles = mysqlTable(
  'staff_roles',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 50 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'staff_roles_id' })],
);

export const tempAccounts = mysqlTable(
  'temp_accounts',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    reference: varchar({ length: 50 }).notNull(),
    accountName: varchar('account_name', { length: 100 }).notNull(),
    accountNumber: varchar('account_number', { length: 50 }).notNull(),
    bankId: varchar('bank_id', { length: 50 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    bankName: varchar('bank_name', { length: 200 }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'temp_accounts_id' })],
);

export const tempRecoveryPhones = mysqlTable(
  'temp_recovery_phones',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    reference: varchar({ length: 30 }).notNull(),
    oldPhone: varchar('old_phone', { length: 15 }).notNull(),
    newPhone: varchar('new_phone', { length: 15 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'temp_recovery_phones_id' }),
  ],
);

export const transactionHistories = mysqlTable(
  'transaction_histories',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    transactionId: bigint('transaction_id', { mode: 'number', unsigned: true }),
    receiverName: varchar('receiver_name', { length: 250 }),
    amount: decimal({ precision: 15, scale: 2, unsigned: true }).notNull(),
    status: mysqlEnum([
      'successful',
      'pending',
      'failed',
      'in-progress',
      'refunded',
    ]).notNull(),
    paymentMode: mysqlEnum('payment_mode', [
      'blue-user',
      'phone',
      'wallet_topup',
      'offline',
      'withdrawal',
      'card',
      'bank-transfer',
      'airtime',
      'data',
      'power',
      'cable-tv',
    ]).notNull(),
    type: mysqlEnum(['credit', 'debit']).notNull(),
    senderName: varchar('sender_name', { length: 100 }),
    clientUsed: mysqlEnum('client_used', ['desktop', 'mobile'])
      .default('mobile')
      .notNull(),
    transactionReference: varchar('transaction_reference', { length: 20 }),
    serviceCharge: decimal('service_charge', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    employeeId: bigint('employee_id', { mode: 'number' }),
    balanceBefore: decimal('balance_before', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    balanceAfter: decimal('balance_after', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    app: varchar({ length: 100 }),
    narration: varchar({ length: 300 }),
  },
  (table) => [
    index('idx_created_at').on(table.createdAt),
    index('idx_payment_mode').on(table.paymentMode),
    index('idx_transaction_reference').on(table.transactionReference),
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'transaction_histories_id' }),
  ],
);

export const transactions = mysqlTable(
  'transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    amount: decimal({ precision: 15, scale: 2 }).notNull(),
    orderReference: varchar('order_reference', { length: 50 }),
    receiverName: varchar('receiver_name', { length: 250 }),
    receiverWallet: varchar('receiver_wallet', { length: 20 }),
    senderName: varchar('sender_name', { length: 300 }),
    paymentMode: mysqlEnum('payment_mode', [
      'blue-user',
      'phone',
      'offline',
      'withdrawal',
      'wallet_topup',
      'card',
      'bank_transfer',
    ]).notNull(),
    clientUsed: mysqlEnum('client_used', ['desktop', 'mobile']).default(
      'mobile',
    ),
    dueDate: datetime('due_date', { mode: 'string' }),
    status: mysqlEnum([
      'in-progress',
      'pending',
      'successful',
      'failed',
      'reversed',
    ])
      .default('pending')
      .notNull(),
    transactionId: varchar('transaction_id', { length: 20 }),
    serviceCharge: decimal('service_charge', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    email: varchar({ length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    employeeId: bigint('employee_id', { mode: 'number' }),
    narration: varchar({ length: 255 }),
    requestBody: varchar('request_body', { length: 1000 }),
    responseBody: varchar('response_body', { length: 10000 }),
    verificationRequest: varchar('verification_request', { length: 1000 }),
    verificationResponse: varchar('verification_response', { length: 1000 }),
    ip: varchar({ length: 20 }),
    receiverType: mysqlEnum('receiver_type', [
      'personal',
      'business',
      'business-personal',
    ]),
    sentBy: varchar('sent_by', { length: 20 }),
    branchId: bigint('branch_id', { mode: 'number' }),
  },
  (table) => [
    index('idx_created_at').on(table.createdAt),
    index('idx_payment_mode').on(table.paymentMode),
    index('idx_status').on(table.status),
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'transactions_id' }),
    unique('idx_transaction_id').on(table.transactionId),
    unique('unique_transaction').on(table.transactionId, table.userId),
  ],
);

export const tvPackages = mysqlTable(
  'tv_packages',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    provider: varchar({ length: 10 }).notNull(),
    code: varchar({ length: 20 }).notNull(),
    name: varchar({ length: 100 }).notNull(),
    amount: decimal({ precision: 12, scale: 2, unsigned: true })
      .default('0.00')
      .notNull(),
    createdAt: datetime('created_at', { mode: 'string' })
      .default(sql`(CURRENT_TIMESTAMP)`)
      .notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'tv_packages_id' })],
);

export const tvProviders = mysqlTable(
  'tv_providers',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    name: varchar({ length: 80 }).notNull(),
    slug: varchar({ length: 10 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    image: varchar({ length: 200 }).notNull(),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'tv_providers_id' })],
);

export const tvTransactions = mysqlTable(
  'tv_transactions',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    receiver: varchar({ length: 25 }).notNull(),
    provider: varchar({ length: 80 }).notNull(),
    package: varchar({ length: 80 }).notNull(),
    amount: decimal({ precision: 12, scale: 2, unsigned: true }),
    paymentReference: varchar('payment_reference', { length: 40 }),
    customerInfo: varchar('customer_info', { length: 100 }),
    customerName: varchar('customer_name', { length: 100 }),
    paymentMode: mysqlEnum('payment_mode', ['wallet', 'card']),
    status: mysqlEnum(['pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    accessToken: varchar('access_token', { length: 40 }),
    transactionId: varchar('transaction_id', { length: 30 }).notNull(),
    phone: varchar({ length: 15 }),
    code: varchar({ length: 200 }),
    serviceCharge: decimal('service_charge', {
      precision: 10,
      scale: 2,
    }).default('100.00'),
    vendRequestBody: varchar('vend_request_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    vendResponseBody: varchar('vend_response_body', { length: 1500 }),
    balanceBefore: decimal('balance_before', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
    balanceAfter: decimal('balance_after', { precision: 15, scale: 2 })
      .default('0.00')
      .notNull(),
  },
  (table) => [
    index('idx_receiver').on(table.receiver),
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'tv_transactions_id' }),
    unique('unq_airtime_txn').on(table.transactionId, table.userId),
  ],
);

export const userAccounts = mysqlTable(
  'user_accounts',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    bankId: bigint('bank_id', { mode: 'number', unsigned: true }).notNull(),
    accountNumber: varchar('account_number', { length: 255 }),
    accountName: varchar('account_name', { length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    bankName: varchar('bank_name', { length: 50 }).notNull(),
  },
  (table) => [
    index('bank_id').on(table.bankId),
    primaryKey({ columns: [table.id], name: 'user_accounts_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const userCardDetails = mysqlTable(
  'user_card_details',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    email: varchar({ length: 255 }).notNull(),
    authorizationCode: varchar('authorization_code', { length: 80 }).notNull(),
    bin: varchar({ length: 20 }).notNull(),
    last4: varchar({ length: 20 }).notNull(),
    expMonth: varchar('exp_month', { length: 20 }).notNull(),
    expYear: varchar('exp_year', { length: 20 }).notNull(),
    cardType: varchar('card_type', { length: 20 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    firstName: varchar('first_name', { length: 60 }),
    lastName: varchar('last_name', { length: 60 }),
    bank: varchar({ length: 60 }),
  },
  (table) => [
    index('idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'user_card_details_id' }),
  ],
);

export const userTokens = mysqlTable(
  'user_tokens',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    fcmToken: varchar('fcm_token', { length: 255 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'user_tokens_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const users = mysqlTable(
  'users',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    firstName: varchar('first_name', { length: 255 }),
    middleName: varchar('middle_name', { length: 255 }),
    lastName: varchar('last_name', { length: 255 }),
    phone: varchar({ length: 50 }).notNull(),
    role: mysqlEnum(['owner', 'employee']).default('owner'),
    type: mysqlEnum(['personal', 'business', 'business_personal']).default(
      'personal',
    ),
    displayPic: varchar('display_pic', { length: 1000 }),
    level: int().default(1),
    password: varchar({ length: 255 }),
    passwordChangedAt: varchar({ length: 255 }),
    isDeleted: tinyint('is_deleted', { unsigned: true }).default(0),
    flagged: tinyint().default(0).notNull(),
    verified: tinyint({ unsigned: true }).default(0),
    resetCredentialStatus: tinyint('reset_credential_status', {
      unsigned: true,
    }).default(0),
    notificationStatus: tinyint('notification_status').default(1).notNull(),
    kycStatus: tinyint('kyc_status', { unsigned: true }).default(0),
    kyc: mysqlEnum(['basic', 'intermediate', 'pro']).default('basic').notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    index('idx_id').on(table.id),
    primaryKey({ columns: [table.id], name: 'users_id' }),
    unique('phone').on(table.phone),
  ],
);

export const ussdWithdrawals = mysqlTable(
  'ussd_withdrawals',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    bankCode: varchar('bank_code', { length: 20 }),
    phoneNumber: varchar('phone_number', { length: 20 }),
    accountNumber: varchar('account_number', { length: 20 }),
    sessionId: varchar('session_id', { length: 150 }),
    amount: decimal({ precision: 8, scale: 2 }).notNull(),
    accountInfo: varchar('account_info', { length: 200 }),
    transactionId: varchar('transaction_id', { length: 40 }),
    reference: varchar({ length: 50 }),
    status: mysqlEnum(['in-progress', 'pending', 'successful', 'failed'])
      .default('pending')
      .notNull(),
    verificationRequestBody: varchar('verification_request_body', {
      length: 500,
    }),
    verificationResponseBody: varchar('verification_response_body', {
      length: 1000,
    }),
    transferRequestBody: varchar('transfer_request_body', { length: 500 }),
    transferResponseBody: varchar('transfer_response_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [primaryKey({ columns: [table.id], name: 'ussd_withdrawals_id' })],
);

export const walletAccounts = mysqlTable(
  'wallet_accounts',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    walletId: bigint('wallet_id', { mode: 'number', unsigned: true }).notNull(),
    status: tinyint({ unsigned: true }).default(0).notNull(),
    accountNumber: varchar('account_number', { length: 50 }),
    accountName: varchar('account_name', { length: 50 }),
    bankName: varchar('bank_name', { length: 250 }),
    referenceNumber: varchar('reference_number', { length: 100 }).notNull(),
    requestBody: varchar('request_body', { length: 1000 }),
    responseBody: varchar('response_body', { length: 1000 }),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    bankLogo: varchar('bank_logo', { length: 255 }),
  },
  (table) => [
    index('user_id').on(table.userId),
    index('wallet_id').on(table.walletId),
    primaryKey({ columns: [table.id], name: 'wallet_accounts_id' }),
    unique('idx_user_id').on(table.userId),
  ],
);

export const walletSnapshots = mysqlTable(
  'wallet_snapshots',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }).notNull(),
    walletId: bigint('wallet_id', { mode: 'number', unsigned: true }).notNull(),
    amount: decimal({ precision: 15, scale: 2 }).notNull(),
    balanceBefore: decimal('balance_before', {
      precision: 15,
      scale: 2,
    }).notNull(),
    balanceAfter: decimal('balance_after', {
      precision: 15,
      scale: 2,
    }).notNull(),
    type: mysqlEnum(['credit', 'debit']).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    transactionReference: varchar('transaction_reference', { length: 20 }),
    isNew: tinyint('is_new').default(0).notNull(),
  },
  (table) => [
    index('idx_transaction_reference').on(table.transactionReference),
    index('wallet_id').on(table.walletId),
    index('ws_idx_created_at').on(table.createdAt),
    index('ws_idx_type').on(table.type),
    index('ws_idx_user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'wallet_snapshots_id' }),
    unique('unique_user_transaction_type').on(
      table.userId,
      table.transactionReference,
      table.type,
    ),
    check('balance_before_non_negative', sql`(\`balance_before\` >= 0)`),
  ],
);

export const wallets = mysqlTable(
  'wallets',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number', unsigned: true }),
    balance: decimal({ precision: 15, scale: 2, unsigned: true }).default(
      '0.00',
    ),
    walletId: varchar('wallet_id', { length: 20 }).notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
    updatedAt: datetime('updated_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
    walletCode: varchar('wallet_code', { length: 20 }).notNull(),
  },
  (table) => [
    index('user_id').on(table.userId),
    primaryKey({ columns: [table.id], name: 'wallets_id' }),
    unique('idx_user_id').on(table.userId),
    unique('idx_wallet_code').on(table.walletId),
    unique('wallet_code').on(table.walletId),
    check('balance_non_negative', sql`(\`balance\` >= 0)`),
  ],
);

export const withdrawCredentials = mysqlTable(
  'withdraw_credentials',
  {
    id: bigint({ mode: 'number', unsigned: true }).autoincrement().notNull(),
    token: varchar({ length: 50 }).notNull(),
    tokenTtl: datetime('token_ttl', { mode: 'string' }).notNull(),
    phone: varchar({ length: 50 }),
    username: varchar({ length: 50 }),
    secretPwd: varchar('secret_pwd', { length: 50 }),
    secretPin: varchar('secret_pin', { length: 50 }),
    chargeRate: decimal('charge_rate', { precision: 5, scale: 0 }),
    createdAt: datetime('created_at', { mode: 'string' }).default(
      sql`(CURRENT_TIMESTAMP)`,
    ),
  },
  (table) => [
    primaryKey({ columns: [table.id], name: 'withdraw_credentials_id' }),
  ],
);

export const withdrawIdempotencyRecords = mysqlTable(
  'withdraw_idempotency_records',
  {
    id: int().autoincrement().notNull(),
    transactionId: varchar('transaction_id', { length: 255 }).notNull(),
    userId: int('user_id').notNull(),
    operationType: varchar('operation_type', { length: 50 }).notNull(),
    responseData: text('response_data').notNull(),
    createdAt: datetime('created_at', { mode: 'string' }).notNull(),
  },
  (table) => [
    index('created_at').on(table.createdAt),
    index('transaction_id').on(
      table.transactionId,
      table.userId,
      table.operationType,
    ),
    primaryKey({
      columns: [table.id],
      name: 'withdraw_idempotency_records_id',
    }),
  ],
);
