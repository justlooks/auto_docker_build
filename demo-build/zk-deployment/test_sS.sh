kubectl get pods -w -l app=zk
for i in 0 1 2; do kubectl exec zk-$i -- hostname; done
for i in 0 1 2; do kubectl exec zk-$i -- hostname -f; done
for i in 0 1 2; do echo "myid zk-$i";kubectl exec zk-$i -- cat /var/lib/zookeeper/data/myid; done
kubectl exec zk-0 -- cat /opt/zookeeper/conf/zoo.cfg

write a key from zk-0
kubectl exec zk-0 zkCli.sh create /hello world
get the key value from zk-1
kubectl exec zk-1 zkCli.sh get /hello
delete statefulset and recreate it ,the key is still there
kubectl exec zk-2 zkCli.sh get /hello
