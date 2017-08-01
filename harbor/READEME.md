这是一个从harbor将image拉到kubernetes并创建pod的例子

kubectl create secret docker-registry harbor-secret --namespace=default --docker-server=harbor.epei360.com --docker-username=username_in_harbor --docker-password=passwd_in_harbor --docker-email=mail_regist_in_harbor

[root@k8s-master ~]# kubectl get secret/harbor-secret -o yaml
apiVersion: v1
data:
  .dockercfg: eyJoYXJi.....
kind: Secret
metadata:
  annotations:
  creationTimestamp: 2017-08-01T01:33:44Z
  name: harbor-secret
  namespace: default
  resourceVersion: "822194"
  selfLink: /api/v1/namespaces/default/secrets/harbor-secret
  uid: 74f7779d-7659-11e7-a25a-00163e024627
type: kubernetes.io/dockercfg

然后在pod文件中使用你的secret

[root@k8s-master ~]# cat demo.yml
apiVersion: v1
kind: Pod
metadata:
  name: demome
  namespace: default
spec:
  containers:
  - image: myimage
    command:
      - sleep
      - "3600"
    imagePullPolicy: IfNotPresent
    name: demome
  imagePullSecrets:
    - name: harbor-secret
  restartPolicy: Always
