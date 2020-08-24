#Push the PVs
kubectl apply -f pv-conf.yaml
kubectl apply -f pv-data.yaml
kubectl apply -f pv-extensions.yaml
kubectl apply -f pv-logs.yaml

#add namespace
kubectl create namespace sq

#deploy the PVCs
kubectl apply -f pvc-conf.yaml
kubectl apply -f pvc-data.yaml
kubectl apply -f pvc-extensions.yaml
kubectl apply -f pvc-logs.yaml

helm3 package .
helm3 install sonarqube sonarqube-0.1.0.tgz --create-namespace --namespace=sq -f values.yaml
