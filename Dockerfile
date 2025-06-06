ARG GO_IMAGE=golang:1.23

FROM ${GO_IMAGE} AS builder
WORKDIR /go/src/app
COPY . .
RUN go vet -v
RUN go test -v
ENV CGO_ENABLED=0 GOOS=linux GOPROXY=direct
RUN go build -v -o app .

FROM scratch AS final
LABEL maintainer="Admir Trakic <atrakic@users.noreply.github.com>"
COPY --from=builder /go/src/app/app /app
ENTRYPOINT ["/app"]
