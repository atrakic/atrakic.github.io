USER ?= $(shell whoami)

all:
	type -a templ || go install github.com/a-h/templ/cmd/templ@latest
	templ generate
	go run . $(USER)
	cat index.html

test:
	go test -v .

clean:
	go clean
	rm -rf index.html
