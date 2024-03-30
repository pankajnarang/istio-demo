# This folder tries to describe the steps used to expose a service using Istio

*   enable istio-injection on default namespace <namespace.yml>
*   create a virtual service for our sampleapi deployment <virtualsvc.yml>
*   create a gateway service for sampleapi virtual service <gateway.yml>
