export DOCKER_BUILDKIT=1

REPOSITORY ?= git@github.com:stelligent/architecture.git

build:
	docker build \
		--build-arg REPOSITORY=$(REPOSITORY) \
		--ssh default \
		-t example/ssh .

run: build
	docker run -it \
		example/ssh /bin/ash
