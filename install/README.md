# This folder contains two different approaches on how Istio can be installed
* By manually using helm directly on any K8s cluster
* By using terraform helm provider to support IAC


## Below are the steps to install Istio manually using Helm

*   helm repo add istio https://istio-release.storage.googleapis.com/charts
*   helm repo update
*   kubectl create namespace istio-system
*   helm install istio-base istio/base -n istio-system --set defaultRevision=default
*   helm ls -n istio-system
*   helm install istiod istio/istiod -n istio-system --wait
*   helm ls -n istio-system
*   helm status istiod -n istio-system
*   kubectl get deployments -n istio-system --output wide

#### Run the below commands to install istio-ingress gateways (both internal and external)
##### Note: Please make sure you have the statip IP reserved in the respective project and have updated the values files accordingly.

*   kubectl create namespace istio-ingress
*   helm upgrade --install istio-ingress istio/gateway -n istio-system -f ingress-values.yml
*   helm upgrade --install istio-ilbgateway istio/gateway -n istio-ingress -f internal-ingress-values.yml

#### Run the below command to make sure everything is up and running as expected
*   kubectl get all -n istio-system
*   kubectl get all -n istio-ingress

#### Cert Manager Installation
*   helm repo add jetstack https://charts.jetstack.io
*   helm repo update
*   helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.12.0 --set installCRDs=true



## Below are the steps to install Istio using terraform helm provider (IAC)
*   cd istio-demo/install
*   terraform init
*   terraform apply 
*   helm list -n istio-system
*   helm status istiod -n istio-system