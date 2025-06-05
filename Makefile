MAKEFLAGS += --silent

OPTIONS ?= --no-color --remove-orphans --build --force-recreate

USER ?= $(shell whoami)

.PHONY: all build docker test clean

all: build test

build:
	type -a templ || go install github.com/a-h/templ/cmd/templ@latest
	templ generate
	go run . $(USER)

docker:
	DOCKER_BUILDKIT=1 docker-compose up $(OPTIONS) -d

test: build
	go vet
	go test -v .

clean:
	go clean
	rm -rf index.html
	docker-compose down --remove-orphans -v --rmi local
