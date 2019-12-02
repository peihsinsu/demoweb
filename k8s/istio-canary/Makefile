
# enable default namespace for istio
step1: 
	kubectl label namespace default istio-injection=enabled

# deploy v1 and v2 services
step2: 
	kubectl apply -f deploy-v1.yaml
	kubectl apply -f svc-v1.yaml
	kubectl apply -f deploy-v2.yaml
	kubectl apply -f svc-v2.yaml

# enable gateway and virtual service
step3: 
	kubectl apply -f gw.yaml
	kubectl apply -f vs.yaml


clean:
	kubectl delete gw --all
	kubectl delete vs --all
	kubectl delete deploy --all
	kubectl delete svc --all
