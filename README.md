# verify-event-store-schema

This repository contains the database migrations for Verify's event recording system.

## Writing a new migration

To write a new migration simply create a new sql script in the sql directory following [Flyway's naming convention](https://flywaydb.org/documentation/migrations#naming-1)

## Writing safe migrations

Note that there are some detailed Architecture Decision Records in this repository
that describe how to write migrations that are:

- Deployed as standalone releases - we want to avoid coupling database changes
too tightly to code changes, as it is extremely hard to deploy these changes
simultaneously without risking downtime. See [ADR 0002](doc/adr/0002-database-migrations-are-standalone-releases.md)
- Safe for zero-downtime deployments - migrations should be written so they
do not block the database for long periods of time.  See [ADR 0003] (doc/adr/0003-database-migrations-should-be-designed-for-zero-downtime.md)

## Running migrations
For an example of running migrations, see the scripts/migrate_test.sh script
