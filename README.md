# auto_docker_build

/var/lib/docker和 /var/log/message和journal会比较大，需要单独挂盘

1.首先创建一个ftp服务器的镜像 
build-ftp-server

2.设置ftp service 并关联NFS pv卷
ftp-deployment

3.自制镜像

