USER ?= $(shell whoami)

all:
	templ generate
	go run . $(USER)
