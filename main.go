package main

import (
	"context"
	"log"
	"os"
)

func main() {
	f, err := os.Create("index.html")
	if err != nil {
		log.Fatalf("failed to create output file: %v", err)
	}

	err = index("atrakic").Render(context.Background(), f)
	if err != nil {
		log.Fatalf("failed to write output file: %v", err)
	}
}
