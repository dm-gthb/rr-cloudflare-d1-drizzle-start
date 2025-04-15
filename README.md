A fullstack template built with React Router 7 Framework mode, Cloudflare Workers, Cloudflare D1, and Drizzle ORM.

# Database
D1 has fully-featured support for local development, with SQLite file in `.wrangler/state/v3/d1`.

## Migrations
Generate migration
```sh
npm run db:generate
```

Run migration:
```sh
npm run db:migrate
```

Run production migration
```sh
npm run db:migrate-production
```

## Seeding
Prepare seeding in `drizzle/seed.sql`.

Run seeding:
```sh
npm run db:seed <db-name>
```

## Drizzle Kit Studio
drizzle-kit studio command spins up a server for Drizzle Studio hosted on local.drizzle.studio. It requires you to specify database connection credentials via `drizzle.config.ts` config file.
```sh
npx drizzle-kit studio
```

## Drop
Drop local db:
```sh
npm run db:drop
```

# General

## Development

Start the development server with HMR:

```bash
npm run dev
```

## Previewing the Production Build

Preview the production build locally:

```bash
npm run preview
```

## Building for Production

Create a production build:

```bash
npm run build
```

## Deployment

Deployment is done using the Wrangler CLI.

Be sure to update the `wrangler.jsonc` file with the correct database name and id.
You will also need to update the `drizzle.config.ts`, and then run the production migration:
```sh
npm run db:migrate-production
```

To build and deploy directly to production:

```sh
npm run deploy
```

To deploy a preview URL:

```sh
npx wrangler versions upload
```

You can then promote a version to production after verification or roll it out progressively.

```sh
npx wrangler versions deploy
```