FROM tomcat:8.5
MAINTAINER Junbo Wang <juniwang@microsoft.com>

COPY init_container.sh /bin/

RUN  \
  echo "root:Docker!" | chpasswd \
  && apt-get update \
  && apt-get install -y --no-install-recommends openssh-server \
  && chmod 755 /bin/init_container.sh 

COPY sshd_config /etc/ssh/

EXPOSE 2222

CMD ["/bin/init_container.sh"]