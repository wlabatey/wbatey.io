#!/usr/bin/env bash

DIR="./public"
BUCKET="wbatey.co"
FLAGS="--exclude .git/ --delete"

while getopts ":d" opt; do
    case ${opt} in
        d )
            FLAGS="--dryrun ${FLAGS}"
            ;;
        \? )
            echo "Usage: $0 [-d]"
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

aws s3 sync ${DIR} s3://${BUCKET} ${FLAGS}

exit 0
