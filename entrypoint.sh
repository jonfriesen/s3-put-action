#!/bin/sh

set -e

# Create basic config for s3cmd
echo "[default]
access_key = ${AWS_ACCESS_KEY_ID}
bucket_location = sfo2
check_ssl_certificate = True
check_ssl_hostname = True
guess_mime_type = True
host_base = ${AWS_ENDPOINT}
host_bucket = %(bucket)s.${AWS_ENDPOINT}
secret_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.s3cfg

echo "Uploading file to ${LOCAL_FILE} to ${REMOTE_FILE}"

if [[ ! -z "$INCLUDE_MD5" ]]; then
    echo "Generating MD5"
    cat ${LOCAL_FILE} | md5sum | awk '{printf $1}' > ${LOCAL_FILE}.md5
    s3cmd put ${LOCAL_FILE}.md5 s3://${AWS_BUCKET}/${REMOTE_FILE}.md5 $*
fi

s3cmd put ${LOCAL_FILE} s3://${AWS_BUCKET}/${REMOTE_FILE} $*
