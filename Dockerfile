FROM centos:7

RUN yum -y update && yum -y install tang xinetd && yum clean all && rm -rf /var/cache/yum
EXPOSE 80

COPY tangd.xinetd /etc/xinetd.d/tangd
COPY entrypoint.sh /usr/local/bin/
COPY tangdw /usr/libexec/
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/xinetd","-dontfork"]
