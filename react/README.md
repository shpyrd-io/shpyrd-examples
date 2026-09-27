# example-react

Vite + React, built in-cluster and served by nginx. `build.buildpacks: [web-servers]` picks the
Paketo web-servers buildpack alone: its frontend flow runs `npm run build` and serves `dist/`.
Without it the Node buildpack would win detection and build an image with no process to run.
