VER=lastet
PROJECT_ID=mitac-simonsu-2017
IMAGE_NAME=demoweb
IMAGE_URL=gcr.io/$(PROJECT_ID)/$(IMAGE_NAME)

docker-build:
	docker build -t $(IMAGE_URL) .
docker-push:
	docker push $(IMAGE_URL))

all: docker-build docker-push

del-k8s:
	kubectl delete svc/demoweb deploy/demoweb

run-k8s:
	kubectl run demoweb --image=peihsinsu/demoweb:$(VER) --port 3000
	kubectl expose deploy/demoweb  --type=NodePort
