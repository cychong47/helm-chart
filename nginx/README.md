# nginx-with-helm
Deploy nginx with helm

# How to use 

## Declare PV
Create a file `nginx-pv.yaml` and change the `path`

```
kind: PersistentVolume
apiVersion: v1
metadata:
  name: nginx-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 12Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "REPLACE_THIS"
```

Then, create PV with kubectl 
```
$ kubectl create -f nginx-pv.yaml 
persistentvolume/nginx-pv created

$ kubectl get pv
NAME       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
nginx-pv   12Gi       RWO            Retain           Available           manual                  8s
```

## Install chart with helm 
```
$ helm install my-nginx nginx-with-helm

NAME:   my-nginx
LAST DEPLOYED: Sun Sep 22 21:39:34 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME      READY  UP-TO-DATE  AVAILABLE  AGE
my-nginx  0/1    1           0          0s

==> v1/PersistentVolumeClaim
NAME       STATUS  VOLUME    CAPACITY  ACCESS MODES  STORAGECLASS  AGE
nginx-pvc  Bound   nginx-pv  12Gi      RWO           manual        1s

==> v1/Pod(related)
NAME                       READY  STATUS   RESTARTS  AGE
my-nginx-5f6578fd76-djd2g  0/1    Pending  0         0s

==> v1/Service
NAME      TYPE      CLUSTER-IP     EXTERNAL-IP  PORT(S)         AGE
my-nginx  NodePort  10.97.215.158  <none>       2368:30025/TCP  1s


NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-nginx)
  export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
```

## Check if the nginx is running by referring the `NOTES` above.

