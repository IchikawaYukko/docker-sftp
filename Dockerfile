FROM    alpine
RUN     apk add --no-cache openssh openssh-sftp-server

EXPOSE  22

# store host key
VOLUME  /etc/ssh
COPY    entrypoint.sh /entrypoint.sh
COPY    sshd_config /etc/ssh/sshd_config

ENTRYPOINT ["/entrypoint.sh"]
CMD     ["/usr/sbin/sshd", "-D", "-e"]
