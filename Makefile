VER=lastet

docker-build:
	docker build -t peihsinsu/demoweb:$(VER) .
docker-push:
	docker push peihsinsu/demoweb:$(VER)

all: docker-build docker-push

del-k8s:
	kubectl delete svc/demoweb deploy/demoweb

run-k8s:
	kubectl run demoweb --image=peihsinsu/demoweb:$(VER) --port 3000
	kubectl expose deploy/demoweb  --type=NodePort
