package main

import (
	"context"
	"fmt"
	"log"
	"os"
)

var skills = []string{
	"Data",
	"HTTP",
	"DevOps",
	"CI/CD",
	"Docker",
	"Kubernetes",
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
	name := "John Doe"
	if len(os.Args) > 1 {
		name = os.Args[1]
	}

	f, err := os.Create("index.html")
	if err != nil {
		log.Fatalf("failed to create output file: %v", err)
	}
	defer f.Close()

	// Use templ to render the template containing the raw HTML.
	if err := index(name).Render(context.Background(), f); err != nil {
		log.Fatalf("failed to write output file: %v", err)
	}

	fmt.Printf("Index page for (%s) generated", name)
}
