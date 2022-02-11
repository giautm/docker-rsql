FROM amazonlinux:2.0.20220121.0

ENV ODBC_VERSION=1.4.45.1000
ENV RSQL_VERSION=1.0.3

RUN yum update -y && \
    yum install -y unixODBC less && \
    yum clean all

RUN rpm -i \
    https://s3.amazonaws.com/redshift-downloads/drivers/odbc/${ODBC_VERSION}/AmazonRedshiftODBC-64-bit-${ODBC_VERSION}-1.x86_64.rpm \
    https://s3.amazonaws.com/redshift-downloads/amazon-redshift-rsql/${RSQL_VERSION}/AmazonRedshiftRsql-${RSQL_VERSION}-1.x86_64.rpm

RUN cp /opt/amazon/redshiftodbc/Setup/odbc.ini ~/.odbc.ini
RUN ln -s /usr/bin/less /usr/bin/more

ENV ODBCINI=~/.odbc.ini
ENV ODBCSYSINI=/opt/amazon/redshiftodbc/Setup
ENV AMAZONREDSHIFTODBCINI=/opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini

ENTRYPOINT ["/usr/bin/rsql"]
