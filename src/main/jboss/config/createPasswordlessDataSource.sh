#!/bin/bash
$JBOSS_HOME/bin/jboss-cli.sh --connect --resolve-parameter-values <<EOF
data-source add --name=CredentialFreeDataSourceDS \
--jndi-name=java:jboss/datasources/CredentialFreeDataSource \
--connection-url=${AZURE_MYSQL_CONNECTIONSTRING}&defaultAuthenticationPlugin=com.azure.identity.extensions.jdbc.mysql.AzureMysqlAuthenticationPlugin&authenticationPlugins=com.azure.identity.extensions.jdbc.mysql.AzureMysqlAuthenticationPlugin \
--driver-name=ROOT.war_com.mysql.cj.jdbc.Driver_8_0 \
--min-pool-size=5 \
--max-pool-size=20 \
--blocking-timeout-wait-millis=5000 \
--enabled=true \
--driver-class=com.mysql.cj.jdbc.Driver \
--jta=true \
--use-java-context=true \
--valid-connection-checker-class-name=org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLValidConnectionChecker \
--exception-sorter-class-name=com.mysql.cj.jdbc.integration.jboss.ExtendedMysqlExceptionSorter
exit
EOF