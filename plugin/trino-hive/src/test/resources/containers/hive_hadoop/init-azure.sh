#!/usr/bin/env bash
set -euo pipefail

# The native Hive image's Hadoop Azure 3.1.2 jar does not include ABFS.
# Use the same ABFS dependencies as the Azure product-test environment.
curl --fail --silent --show-error --location --retry 5 --retry-delay 2 \
    -o /opt/hadoop/share/hadoop/tools/lib/hadoop-azure-3.2.4.jar \
    https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.2.4/hadoop-azure-3.2.4.jar
curl --fail --silent --show-error --location --retry 5 --retry-delay 2 \
    -o /opt/hadoop/share/hadoop/tools/lib/wildfly-openssl-1.0.7.Final.jar \
    https://repo1.maven.org/maven2/org/wildfly/openssl/wildfly-openssl/1.0.7.Final/wildfly-openssl-1.0.7.Final.jar

rm /opt/hadoop/share/hadoop/tools/lib/hadoop-azure-3.1.2.jar
