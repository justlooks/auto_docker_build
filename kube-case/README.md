case 1 : 将pod指定到某个节点运行

首先将节点打上标记
# kubectl label nodes k8s-node1 disktype=ssd

apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  nodeSelector:
    disktype: ssd

case 2 :  在pod中指定初始化container，在初始化container执行完毕后，其他的container才运行，例子中初始化container和正式container共享同一个目录，初始化container从网络某地拉取一个文件到共享目录，然后正式container运行

apiVersion: v1
kind: Pod
metadata:
  name: init-demo
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
    volumeMounts:
    - name: workdir
      mountPath: /usr/share/nginx/html
  # These containers are run during pod initialization
  initContainers:
  - name: install
    image: busybox
    command:
    - wget
    - "-O"
    - "/work-dir/index.html"
    - http://kubernetes.io
    volumeMounts:
    - name: workdir
      mountPath: "/work-dir"
  dnsPolicy: Default
  volumes:
  - name: workdir
    emptyDir: {}


case 3 : k8s在container启动前和停止前发送event（不能保证postStart先于container的entrypoint前执行，因为是和docker代码相独立的）
https://kubernetes.io/docs/user-guide/pods/#termination-of-pods

apiVersion: v1
kind: Pod
metadata:
  name: lifecycle-demo
spec:
  containers:
  - name: lifecycle-demo-container
    image: nginx

    lifecycle:
      postStart:
        exec:
          command: ["/bin/sh", "-c", "echo Hello from the postStart handler > /usr/share/message"]
      preStop:
        exec:
          command: ["/usr/sbin/nginx","-s","quit"]
