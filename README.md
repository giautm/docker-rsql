# docker-rsql

Docker image to use [Amazon Redshift RSQL](https://docs.aws.amazon.com/redshift/latest/mgmt/rsql-query-tool.html) to interact with Redshift clusters from the command-line.

Example command to run the container:

```shell
docker run --platform=linux/x86_64 \
  -e RSPASSWORD="PASSWORD_HERE" redshift \
  -h <host>.redshift-serverless.amazonaws.com \
  -U admin \
  -d dev -c "SELECT 1"
```