本目录下是一个创建静态卷，并声明关联app的例子

创建隔离空间
# kubectl create namespace demo

pvc对pv的作用生命周期
Provisioning ——-> Binding ——–>Using——>Releasing——>Recycling

创建pv & pvc
# kubectl apply -f storage.pv.yml
# kubectl apply -f storage.pvc.yml 

check if ok
# kubectl describe pv/nfs-pv-1g --namespace demo
# kubectl describe pvc/nfs-ftp-pvc --namespace demo

创建secret 使用私服
# kubectl create secret docker-registry demo-registry --namespace=demo --docker-server=harbor.mydomain.com --docker-username=username --docker-password=psswd --docker-email=username@mail.com


创建deployment
# kubectl apply -f ftpwithpv-deploy.yml
确认创建ok
# kubectl get deploy --namespace demo
