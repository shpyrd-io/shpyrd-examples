// Which commit is running? The platform tells every process through
// REVISION (and SHPYRD_REVISION): the git commit the source was archived
// from, or the git revision it was built from.
package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

var started = time.Now()

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		rev := os.Getenv("REVISION")
		if rev == "" {
			rev = "(REVISION not set)"
		}
		fmt.Fprintf(w, "revision %s\nproject %s, workspace %s\nup since %s\n", rev, os.Getenv("SHPYRD_PROJECT"), os.Getenv("SHPYRD_WORKSPACE"), started.UTC().Format(time.RFC3339))
	})
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
