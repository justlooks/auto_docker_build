bash mkimage-yum.sh -p "bind-utils" hch_baseimage

redis make

因为这里用到c所以使用 -static -static-libgcc，如果用到c＋＋则要使用-static-libstdc++  -static-libasan  -static-libtsan选项编译

make CFLAGS="-static -static-libgcc" MALLOC=libc

# ldd redis-server
	linux-vdso.so.1 =>  (0x00007ffff6f8e000)
	libm.so.6 => /lib64/libm.so.6 (0x0000003533e00000)
	libdl.so.2 => /lib64/libdl.so.2 (0x0000003533600000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x0000003533200000)
	libc.so.6 => /lib64/libc.so.6 (0x0000003532e00000)
	/lib64/ld-linux-x86-64.so.2 (0x0000003532600000)


[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-server usr/local/bin/
[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-cli usr/local/bin/
[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-check-aof usr/local/bin/
[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-check-rdb usr/local/bin/
[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-benchmark usr/local/bin/
[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-sentinel usr/local/bin/
[root@dev_mysql1 ~]# cp redis-4.0.1/src/redis-trib.rb usr/local/bin/

# tar czvf rootfs.tar.gz usr/local/bin/* lib64/*
usr/local/bin/redis-benchmark
usr/local/bin/redis-check-aof
usr/local/bin/redis-check-rdb
usr/local/bin/redis-cli
usr/local/bin/redis-sentinel
usr/local/bin/redis-server
usr/local/bin/redis-trib.rb
lib64/ld-linux-x86-64.so.2
lib64/libc.so.6
lib64/libdl.so.2
lib64/libm.so.6
lib64/libpthread.so.0


docker exec -it 46cb621eb360 redis-cli -a xZ7ScgiMV1Acv3h4 info

reference
http://william-yeh.github.io/docker-mini/#117
