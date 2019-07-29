#!/bin/sh

java -Dcom.sun.management.jmxremote \
     -Dcom.sun.management.jmxremote.ssl=false \
     -Dcom.sun.management.jmxremote.authenticate=false \
     -Dcom.sun.management.jmxremote.port=9000 \
     -Dcom.sun.management.jmxremote.rmi.port=9000 \
     -Djava.rmi.server.hostname=192.168.56.101 \
     EchoServer 8088
