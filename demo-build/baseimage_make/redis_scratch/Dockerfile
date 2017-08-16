FROM scratch
ADD  rootfs.tar.gz  /
COPY redis.conf /etc/redis/redis.conf
EXPOSE 6379
CMD ["redis-server"]
