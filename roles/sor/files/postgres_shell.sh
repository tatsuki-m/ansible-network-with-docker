#! /bin/bash

# set environment variables
DBNAME={{ dbname }}
DBUSERNAME={{ current_user }}

# checkout user to postgres
su - postgres
createusre -P $DBUSERNAME
createdatabase $DBNAME
psql -U$DBUSERNAME $DBNAME < ./negi/template/scripts/negi.sql

