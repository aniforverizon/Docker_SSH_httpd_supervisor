FROM centos:7

MAINTAINER ashrithr

USER root

# Install packages
RUN \
  rpm --rebuilddb && \
  yum update -y && \
  yum install -y openssh openssh-server openssh-clients passwd && \
  yum install -y net-tools iproute hostname yum-utils which sudo && \
  yum install -y python-setuptools && \
  yum install -y httpd && \
  rm -rf /var/cache/yum/* && \
  yum clean all

ADD ssh-bootstrap.conf /etc/ssh-bootstrap.conf
ADD ssh-bootstrap /etc/ssh-bootstrap
ADD files /

RUN chmod +x /etc/ssh-bootstrap

RUN \
  easy_install 'supervisor == 3.2.0' 'supervisor-stdout == 0.1.1' && \
  mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisord.conf"]

EXPOSE 22
