// A Go HTTP server: the Go buildpack compiles it, the image runs the binary.
package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		who := r.Header.Get("X-Shpyrd-User")
		if who == "" {
			who = "anonymous visitor"
		}
		fmt.Fprintf(w, "Hello from Go on shpyrd, %s. Project %s, workspace %s.\n", who, os.Getenv("SHPYRD_PROJECT"), os.Getenv("SHPYRD_WORKSPACE"))
	})
	log.Printf("listening on :%s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
