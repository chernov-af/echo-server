FROM gidikern/rhel-oracle-jre

EXPOSE 8088

RUN mkdir -p /opt/app/ \
&& chgrp -R root /var/ /usr/ /run /opt/ /lib64/ /etc/ /bin/ /sbin/ /srv/ /tmp/ \
&& chmod -R g+rwX /var/ /usr/ /run /opt/ /lib64/ /etc/ /bin/ /sbin/ /srv/ /tmp/

COPY EchoServer.class EchoServerRun.sh /opt/app/

RUN chmod +x /opt/app/EchoServerRun.sh

WORKDIR /opt/app/
USER 1001:root

CMD ["/opt/app/EchoServerRun.sh"]
