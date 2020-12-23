#!/bin/sh

# Если не настроен port forwarding для порта 7091 на локальную машину (с которой будет выполняться удалённый attach к этому серверу),
# то потребуется в параметре java.rmi.server.hostname указать ip/hostname этого сервера, видимый с локальной машины.
java -Djava.rmi.server.hostname=127.0.0.1 \
     -Dcom.sun.management.jmxremote \
     -Dcom.sun.management.jmxremote.port=7091 \
     -Dcom.sun.management.jmxremote.rmi.port=7091 \
     -Dcom.sun.management.jmxremote.local.only=false \
     -Dcom.sun.management.jmxremote.authenticate=false \
     -Dcom.sun.management.jmxremote.ssl=false \
     EchoServer 8088
