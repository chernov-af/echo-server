#!/bin/sh

# ���� �� �������� port forwarding ��� ����� 7091 �� ��������� ������ (� ������� ����� ����������� �������� attach � ����� �������),
# �� ����������� � ��������� java.rmi.server.hostname ������� ip/hostname ����� �������, ������� � ��������� ������.
java -Djava.rmi.server.hostname=127.0.0.1 \
     -Dcom.sun.management.jmxremote \
     -Dcom.sun.management.jmxremote.port=7091 \
     -Dcom.sun.management.jmxremote.rmi.port=7091 \
     -Dcom.sun.management.jmxremote.local.only=false \
     -Dcom.sun.management.jmxremote.authenticate=false \
     -Dcom.sun.management.jmxremote.ssl=false \
     EchoServer 8088
