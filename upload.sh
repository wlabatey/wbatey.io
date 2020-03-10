#!/usr/bin/env bash

DIR="./public"
BUCKET="wbatey.io"
CLOUDFRONT_ID="E1CAIX02NMO93L"
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

aws s3 sync ${DIR} s3://${BUCKET} ${FLAGS} --metadata '{"------666------a-secret-is-revealed!------666------": "!oremoR nhoJ ,em llik tsum uoy emag eht niw oT"}'

if [[ "${FLAGS}" != *"--dryrun"* ]]; then
    aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_ID} --paths "/*"
fi

exit 0
