# Fix upstart under a virtual host https://github.com/dotcloud/docker/issues/1024
sudo  dpkg-divert --local --rename --add /sbin/initctl && rm -f /sbin/initctl && ln -s /bin/true /sbin/initctl
