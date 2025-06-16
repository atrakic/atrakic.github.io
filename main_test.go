package main

import (
	"bytes"
	"os"
	"strings"
	"testing"
)

func TestMainWithCustomName(t *testing.T) {
	// Redirect stdout
	old := os.Stdout
	r, w, _ := os.Pipe()
	os.Stdout = w

	// Set custom name arg
	oldArgs := os.Args
	os.Args = []string{"main", "Jane Doe"}

	main()

	w.Close()
	os.Stdout = old

	var buf bytes.Buffer
	buf.ReadFrom(r)
	output := buf.String()

	expectedOutput := "Jane Doe"
	if !strings.Contains(output, expectedOutput) {
		t.Errorf("Expected output to contain %q, got %q", expectedOutput, output)
	}

	// Restore args
	os.Args = oldArgs
}
