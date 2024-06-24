# Postgres Backup to AWS S3 by Cron job

A super simple logic for cron-based PostgreSQL backups, uploading them to AWS S3.

## Environment Variables

The following environment variables are required to configure the backup and upload process:

```env
# PostgreSQL Database Configuration
PG_HOST=db-host
PG_PORT=5432
PG_USER=user
PGPASSWORD=pass
PG_DB=db

# AWS S3 Configuration
S3_BUCKET=bucket-name
AWS_ACCESS_KEY_ID=KEY
AWS_SECRET_ACCESS_KEY=SECRET_KEY
AWS_ENDPOINT_URL=URL
AWS_REGION=REGION

# Cron Schedule
CRON_SCHEDULE=* * * * *
```

## Quick start

Don't forget to specify PostgreSQL image version in Dockerfile. By now it's **postgres:16**

```bash
docker build -t postgres-backup .
```

```bash
docker run --rm --name postgres-backup --env-file .env postgres-backup
```
