# Installing DB2 helm release on ICP  

The installation is documented in the first page of the DB2 helm configuration page. We selected a single instance non HA, for our development environment. HA will be setup for the production environment.
The steps can be summarized as:
* You need to be a subscriber in docker store of the IBM DB2 image so when the container is scheduled, ICP can download the image under your credential.
* So to automate the process we need an API Token. Get your API token from your dockerhub account. Select Account Settings and scroll down and Add API key.
* Add this token as part of a secret in the default namespace with a command like:
 `kubectl create secret docker-registry jbdockersecret --docker-username=<yourusername> --docker-password=<api-token> --docker-email=<> --namespace=default`
 This secret will be used with helm install.
* As we need to create persistence volume for at least 20G, you need to access a NFS server. Can be on IBM Cloud or within your data center.
* Within your NFS server, and create a new folder on the exported filesystems (`$ exports`). We created `gcdb2` folder under `/nfs2` filesystem.
* create a yaml file to create the persistence volume. See it under the scripts folder of this project.
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: db2pv
  labels:
    assign-to: "data-stor"
spec:
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteOnce
  nfs:
    server: 10.177....
    path: /nfs2/gcdb2
```
* Then create the persistence volume
```
$ kubectl -f db2pv.yaml
```
* Add a RBAC role:
`$ kubectl create clusterrolebinding db2-privileged --serviceaccount=db2:default --clusterrole=privileged`

* Perform the release installation:
`$ helm install --name gc-db2 ibm/ibm-db2oltp-dev  --set global.image.secretName=jbdockersecret  --tls`

* Verify the installation using the Event view within the created pod and the logs for a `successful setup` message.  

* Get the db2 user password with:
`get secret --namespace default gc-db2-ibm-db2oltp-dev -o jsonpath="{.data.password}"  | base64 --decode; echo`
