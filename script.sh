#!/bin/bash

BACKUP_DATE=$(date +\%Y-\%m-\%d)
BACKUP_TIME=$(date +\%H_\%M)

BACKUP_FILE_PATH="/tmp/${BACKUP_DATE}__${BACKUP_TIME}.sql"

export PGPASSWORD=${PG_PASSWORD}
pg_dump -h ${PG_HOST} -p ${PG_PORT} -U ${PG_USER} ${PG_DB} > ${BACKUP_FILE_PATH}

aws --endpoint-url=${AWS_ENDPOINT_URL} s3 cp ${BACKUP_FILE_PATH} s3://${S3_BUCKET}

rm ${BACKUP_FILE_PATH}
