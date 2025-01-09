package main

import (
	"context"
	"log"
	"os"
)

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
