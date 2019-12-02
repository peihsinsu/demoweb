export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

# enable default namespace for istio
step1: 
	kubectl label namespace default istio-injection=enabled

# deploy v1 and v2 services
step2: 
	kubectl apply -f deploy.yaml
	kubectl apply -f svc.yaml

# enable gateway and virtual service
step3: 
	kubectl apply -f gw.yaml
	kubectl apply -f vs.yaml


clean:
	kubectl delete gw --all
	kubectl delete vs --all
	kubectl delete deploy --all
	kubectl delete svc --all
