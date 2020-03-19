docker/init:
	docker login -u="micke136" -p="$(DOCKER_PASSWORD)"

docker/build: docker/init 
	docker build -f Dockerfile --build-arg coveralls_token=${COVERALLS_TOKEN} .