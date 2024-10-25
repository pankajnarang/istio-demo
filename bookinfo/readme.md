### An example from Istio website

kubectl exec "$(kubectl get pod -n prod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -n prod -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"

kubectl get pods -n prod

kubectl get svc -n prod 

kubectl get events -n prod

kubectl port-forward service/productpage -n prod  9080:9080