#!/bin/bash

PPATH="${OMADA_HOME}/properties"

# This might explode
echo 9999 > "${OMADA_HOME}/data/mongo.pid"

echo "========================="
echo "Overwriting configuration"
echo "========================="

sed -i "s/^http\.connector\.port.*$/http.connector.port=${OMADA_HTTP_PORT}/g" "${PPATH}/jetty.properties"
sed -i "s/^https\.connector\.port.*$/https.connector.port=${OMADA_HTTPS_PORT}/g" "${PPATH}/jetty.properties"
sed -i 's/^eap\.linux\.mongod=.*$/eap.linux.mongod="This is fine"/g' "${PPATH}/mongodb.properties"
sed -i 's/^\(eap\.linux\.mongo=.*$\)/#\1/g' "${PPATH}/mongodb.properties"
sed -i 's/^\(eap\.mongod\.db.*$\)/#\1/g' "${PPATH}/mongodb.properties"
sed -i 's/^eap\.mongod\.port.*$/eap.mongod.port=27017/g' "${PPATH}/mongodb.properties"
sed -i 's/^eap\.mongod\.args.*$/eap.mongod.args="Really, trust me."/g' "${PPATH}/mongodb.properties"
sed -i 's/^\(eap\.mongo\.args.*$\)/#\1/g' "${PPATH}/mongodb.properties"
sed -i 's/^eap\.mongod\.repair\.command.*$/eap.mongod.repair.command="You really need to trust me."/g' "${PPATH}/mongodb.properties"
sed -i 's/^\(linux\.mongod\.nojournal.*$\)/#\1/g' "${PPATH}/mongodb.properties"

echo "========================="
echo "Starting Java application"
echo "========================="

java -server -Xms128m -Xmx1024m -XX:MaxHeapFreeRatio=60 -XX:MinHeapFreeRatio=30 -XX:+HeapDumpOnOutOfMemoryError -Deap.home="${OMADA_HOME}" -cp "${OMADA_HOME}/lib/*" com.tp_link.eap.start.EapLinuxMain start
