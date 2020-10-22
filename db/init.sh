#!/usr/bin/env sh

######################################################################
# @author      : annika
# @file        : init
# @created     : Wednesday Oct 21, 2020 21:05:07 CEST
#
# @description :  Initialize the database
######################################################################

if [ -z $PSQL ]; then
    PSQL="psql"
fi

if [ -z $DB_HOST ]; then
    DB_HOST="localhost"
fi

if [ -z $DB_PORT ]; then
    DB_PORT="5432"
fi

if [ -z $DB_NAME ]; then
    DB_NAME="b3scale"
fi

if [ -z $DB_USER ]; then
    DB_USER="postgres"
fi

if [ -z $DB_PASSWORD ]; then
    DB_PASSWORD="postgres"
fi

## Setup postgres env
export PGHOST=$DB_HOST
export PGPORT=$DB_PORT
export PGDATABASE=$DB_NAME
export PGUSER=$DB_USER
export PGPASSWORD=$DB_PASSWORD


## Commandline opts: 
if [ "$1" == "-h" ]; then
    echo "Options:"
    echo "   -h     Show this helpful text"
    echo "   -c     Drop and create the database"
    exit
fi

if [ "$1" == "-c" ]; then
    echo "Clearing database..."
    $PSQL template1 -c "DROP DATABASE $DB_NAME"
    $PSQL template1 -c "CREATE DATABASE $DB_NAME"
fi

## Apply sql scripts
$PSQL < schema/0001_initial_tables.sql
