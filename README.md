# GitHub Action for pushing files to S3


### Required Environment Variables
#### Below should be secrets
- `AWS_ACCESS_KEY_ID` S3 Access key
- `AWS_SECRET_ACCESS_KEY` S3 Secret Access key
- `AWS_ENDPOINT` S3 Region + Domain (eg. sfo2.digitaloceanspaces.com)
- `AWS_BUCKET` Bucket name
#### These should be defined in your Action workflow
- `LOCAL_FILE` location of file for upload
- `REMOTE_FILE` intended location for file
#### Optiona
- `INCLUDE_MD5` will include your file postfixed with `.md5` and the md5 hash for that binary

### Example

```
- name: Release Binary to S3
      uses: jonfriesen/s3-put-action@v1.0.0
      with:
        args: --acl-public
      env:
        LOCAL_FILE: dist/MyApp
        REMOTE_FILE: downloads/latest/MyApp
        AWS_ENDPOINT: ${{ secrets.AWS_ENDPOINT }}
        AWS_BUCKET: ${{ secrets.AWS_BUCKET }}
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

### Advanced
This action is ultra simple and uses [s3cmd](https://github.com/s3tools/s3cmd) under the hood. The execution of a call looks like:

```
s3cmd put ${LOCAL_FILE} s3://${AWS_BUCKET}/${REMOTE_FILE} $*
```

adding arguments to (as in the example above) can be done easily with "with" params. 