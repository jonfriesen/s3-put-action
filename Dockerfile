FROM python:2.7-alpine

LABEL "name"="S3Cmd Container"
LABEL "maintainer"="Jon Friesen"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="S3Cmd File Uploader"
LABEL "com.github.actions.description"="S3Cmd File Uploader"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

RUN apk add --no-cache py-pip ca-certificates && pip install s3cmd

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
