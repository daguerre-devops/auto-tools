FROM debian:12

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends systemd python3 sudo bash net-tools openssh-server openssh-client vim git\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
RUN sed -i 's#root:\*#root:sa3tHJ3/KuYvI#' /etc/shadow

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]


