FROM amazonlinux:2.0.20240306.2

ENV ODBC_VERSION=1.5.9.1011
ENV RSQL_VERSION=1.0.8

RUN yum update -y && \
    yum install -y unixODBC less && \
    yum clean all

RUN rpm -i \
    https://s3.amazonaws.com/redshift-downloads/drivers/odbc/${ODBC_VERSION}/AmazonRedshiftODBC-64-bit-${ODBC_VERSION}-1.x86_64.rpm \
    https://s3.amazonaws.com/redshift-downloads/amazon-redshift-rsql/${RSQL_VERSION}/AmazonRedshiftRsql-${RSQL_VERSION}.x86_64.rpm

RUN cp /opt/amazon/redshiftodbc/Setup/odbc.ini ~/.odbc.ini
RUN ln -s /usr/bin/less /usr/bin/more

ENV ODBCINI=~/.odbc.ini
ENV ODBCSYSINI=/opt/amazon/redshiftodbc/Setup
ENV AMAZONREDSHIFTODBCINI=/opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini

ENTRYPOINT ["/usr/bin/rsql"]
