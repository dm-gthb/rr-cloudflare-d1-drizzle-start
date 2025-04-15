CREATE TABLE `Category` (
	`id` integer PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`createdAt` text DEFAULT (current_timestamp) NOT NULL,
	`updatedAt` text DEFAULT (current_timestamp) NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `Category_name_unique` ON `Category` (`name`);--> statement-breakpoint
CREATE TABLE `Comment` (
	`id` integer PRIMARY KEY NOT NULL,
	`text` text NOT NULL,
	`userId` text NOT NULL,
	`offerId` text NOT NULL,
	`createdAt` text DEFAULT (current_timestamp) NOT NULL,
	`updatedAt` text DEFAULT (current_timestamp) NOT NULL
);
--> statement-breakpoint
CREATE TABLE `OfferToCategory` (
	`offerId` text NOT NULL,
	`categoryId` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `Offer` (
	`id` integer PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`description` text NOT NULL,
	`sum` integer NOT NULL,
	`images` text DEFAULT '[]' NOT NULL,
	`ownerId` text NOT NULL,
	`createdAt` text DEFAULT (current_timestamp) NOT NULL,
	`updatedAt` text DEFAULT (current_timestamp) NOT NULL
);
--> statement-breakpoint
CREATE TABLE `User` (
	`id` integer PRIMARY KEY NOT NULL,
	`email` text NOT NULL,
	`name` text NOT NULL,
	`avatarUrl` text,
	`createdAt` text DEFAULT (current_timestamp) NOT NULL,
	`updatedAt` text DEFAULT (current_timestamp) NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `User_email_unique` ON `User` (`email`);