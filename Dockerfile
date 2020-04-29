FROM registry.fedoraproject.org/fedora-minimal:32

RUN microdnf -y install tang xinetd && microdnf clean all && rm -rf /var/cache/yum
EXPOSE 80

COPY tangd.xinetd /etc/xinetd.d/tangd
COPY entrypoint.sh /usr/local/bin/
COPY tangdw /usr/libexec/
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/xinetd","-dontfork"]
