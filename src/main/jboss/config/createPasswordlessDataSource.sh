#!/bin/bash
$JBOSS_HOME/bin/jboss-cli.sh --connect <<EOF
data-source add --name=CredentialFreeDataSourceDS \
--jndi-name=java:jboss/datasources/CredentialFreeDataSource \
--connection-url=${env.AZURE_MYSQL_CONNECTIONSTRING}&defaultAuthenticationPlugin=com.azure.identity.extensions.jdbc.mysql.AzureMysqlAuthenticationPlugin&authenticationPlugins=com.azure.identity.extensions.jdbc.mysql.AzureMysqlAuthenticationPlugin \
--driver-name=mysql \
--use-ccm=true \
--max-pool-size=5 \
--blocking-timeout-wait-millis=5000 \
--enabled=true \
--driver-class=com.mysql.cj.jdbc.Driver \
--jta=true \
--use-java-context=true \
--valid-connection-checker-class-name=org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLValidConnectionChecker \
--exception-sorter-class-name=org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLExceptionSorter
exit
EOF
