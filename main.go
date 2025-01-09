package main

import (
	"context"
	"log"
	"os"
)

var skills = []string{
	"Data",
	"HTTP",
	"DevOps",
	"CI/CD",
	"Security",
	"Cloud computing",
	"Docker",
	"Kubernetes",
	"Git",
	"JavaScript",
	"Node.js",
	"AWS",
	"Azure",
	"SQL",
	"Dotnet",
	"Python",
	"Golang",
	"Linux",
}

func main() {
	if len(os.Args) < 2 {
		log.Fatalf("usage: %s <name>", os.Args[0])
	}
	name := os.Args[1]

	f, err := os.Create("index.html")
	if err != nil {
		log.Fatalf("failed to create output file: %v", err)
	}

	err = index(name).Render(context.Background(), f)
	if err != nil {
		log.Fatalf("failed to write output file: %v", err)
	}
}
