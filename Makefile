PACKAGES := $(shell go list ./...)
name := $(shell basename ${PWD})

MAKEFLAGS += --silent

OPTIONS ?= --no-color --remove-orphans --build --force-recreate
USER ?= $(shell whoami)

.PHONY: all build docker test clean

all: help

.PHONY: help
help: Makefile
	@echo
	@echo " Choose a make command to run"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## init: initialize project (make init module=github.com/user/project)
init:
	go mod init ${module} || true
	type -a templ || go install github.com/a-h/templ/cmd/templ@latest
	templ generate

## build: build a binary
build: init test
	go build -o $(name)

## run: run a binary
run:
	go run . $(USER)

## docker: build project into a docker container image
docker:
	DOCKER_BUILDKIT=1 docker-compose up $(OPTIONS) -d


## vet: vet code
.PHONY: vet
vet:
	go vet $(PACKAGES)

## test: run unit tests
test:
	go vet
	go test -v .

clean:
	go clean
	rm -rf index.html
	docker-compose down --remove-orphans -v --rmi local
