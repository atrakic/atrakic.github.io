FROM golang:1.23 AS builder
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go install github.com/a-h/templ/cmd/templ@latest
RUN templ generate
RUN go vet -v
RUN go test -v
RUN CGO_ENABLED=0 GOOS=linux go build -o /app

FROM scratch AS generator
COPY --from=builder /app /app
RUN ["/app"]

FROM nginx:stable-alpine AS final
COPY --from=builder /src/assets /usr/share/nginx/html/assets
COPY --from=generator /index.html /usr/share/nginx/html/index.html
