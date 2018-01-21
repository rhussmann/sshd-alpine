FROM sickp/alpine-sshd:7.5

ADD sshd_config /etc/ssh/sshd_config
ADD https://github.com/rhussmann.keys /home/rhussmann/.ssh/authorized_keys
RUN \
  passwd -d root && \
  adduser -D -s /bin/ash rhussmann && \
  passwd -u rhussmann && \
  chown -R rhussmann:rhussmann /home/rhussmann && \
  ssh-keygen -A
