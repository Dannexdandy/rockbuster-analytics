#!/bin/bash
set -e
echo "Restoring dvdrental seed data..."
pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" --no-owner /data/dvdrental.tar
echo "Applying indexes..."
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /sql/00_setup/indexes.sql
echo "Load complete."