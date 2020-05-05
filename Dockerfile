FROM centos:7

RUN useradd dev
RUN echo 'dev:mypass' | chpasswd

RUN yum install -y openssh-server rsync
RUN ssh-keygen -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -N '' -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -N '' -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
RUN echo /usr/sbin/sshd >> /root/.bashrc && source /root/.bashrc
RUN sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/' /etc/ssh/sshd_config

RUN yum install -y gcc gcc-c++ make
RUN yum install -y epel-release
RUN yum install -y cmake3

## for remote debug
RUN yum install -y gdb-gdbserver centos-release-scl-rh
RUN yum --enablerepo=centos-sclo-rh install -y devtoolset-7-gdb
COPY _attach_process.sh /home/dev/
RUN chmod +x /home/dev/_attach_process.sh

EXPOSE 22 22244

CMD ["/bin/bash"]