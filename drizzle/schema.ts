import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core';
import { relations, sql } from 'drizzle-orm';

const timestamps = {
  createdAt: text('createdAt')
    .notNull()
    .default(sql`(current_timestamp)`),
  updatedAt: text('updatedAt')
    .notNull()
    .default(sql`(current_timestamp)`),
};

export const users = sqliteTable('User', {
  id: integer().primaryKey(),
  email: text().unique().notNull(),
  name: text().notNull(),
  avatarUrl: text(),
  ...timestamps,
});

export const offers = sqliteTable('Offer', {
  id: integer().primaryKey(),
  title: text().notNull(),
  description: text().notNull(),
  sum: integer().notNull(),
  images: text({ mode: 'json' }).notNull().default('[]'),
  ownerId: text().notNull(),
  ...timestamps,
});

export const categories = sqliteTable('Category', {
  id: integer().primaryKey(),
  name: text().unique().notNull(),
  ...timestamps,
});

export const comments = sqliteTable('Comment', {
  id: integer().primaryKey(),
  text: text().notNull(),
  userId: text().notNull(),
  offerId: text().notNull(),
  ...timestamps,
});

export const offerToCategory = sqliteTable('OfferToCategory', {
  offerId: text().notNull(),
  categoryId: text().notNull(),
});

export const userRelations = relations(users, ({ many }) => ({
  offers: many(offers),
  comments: many(comments),
}));

export const offerRelations = relations(offers, ({ one, many }) => ({
  owner: one(users, {
    fields: [offers.ownerId],
    references: [users.id],
  }),
  comments: many(comments),
  categories: many(offerToCategory),
}));

export const commentRelations = relations(comments, ({ one }) => ({
  user: one(users, {
    fields: [comments.userId],
    references: [users.id],
  }),
  offer: one(offers, {
    fields: [comments.offerId],
    references: [offers.id],
  }),
}));

export const categoryRelations = relations(categories, ({ many }) => ({
  offers: many(offerToCategory),
}));

export const offerToCategoryRelations = relations(offerToCategory, ({ one }) => ({
  offer: one(offers, {
    fields: [offerToCategory.offerId],
    references: [offers.id],
  }),
  category: one(categories, {
    fields: [offerToCategory.categoryId],
    references: [categories.id],
  }),
}));
