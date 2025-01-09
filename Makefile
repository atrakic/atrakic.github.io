USER ?= atrakic

all:
	templ generate
	go run . $(USER)
