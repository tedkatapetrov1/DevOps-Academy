FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y && apt install openjdk-11-jre -y

RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa

RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

EXPOSE 22 3000

CMD ["/usr/sbin/sshd","-D"]