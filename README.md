# shpyrd examples

Small projects that run on [shpyrd](https://github.com/shpyrd-io/shpyrd), one per
directory, each with its `shpyrd.yaml`. Every one of them is deployed to the `demo`
workspace of the shpyrd cloud: `https://example-<name>.demo.shpyrd.app`.

Deploy any of them from its directory:

```sh
shpyrd login https://demo.shpyrd.app     # or your own cluster
cd go
shpyrd projects create example-go --public   # once
shpyrd deploy
```

| Directory | What | How it builds |
| --- | --- | --- |
| [`static-nginx`](static-nginx) | static site on nginx | web-servers buildpack (`BP_WEB_SERVER=nginx`) |
| [`static-httpd`](static-httpd) | static site on Apache httpd | web-servers buildpack (`BP_WEB_SERVER=httpd`) |
| [`react`](react) | Vite + React, static | Node buildpack builds, nginx serves `dist/` |
| [`nextjs`](nextjs) | Next.js, server-rendered | Node buildpack, `next build` then `next start` |
| [`go`](go) | Go HTTP server | Go buildpack |
| [`php`](php) | PHP page | PHP buildpack (nginx + PHP-FPM) |
| [`sinatra`](sinatra) | Sinatra + puma | Ruby buildpack, Procfile |
| [`rails`](rails) | Rails with PostgreSQL and a release phase | Ruby buildpack; Procfile `release:` runs `db:prepare` |
| [`python`](python) | Flask + gunicorn | Python buildpack, Procfile |
| [`java`](java) | Java 21, no framework | Java buildpack (Maven) |
| [`node`](node) | Express | Node buildpack |
| [`dotnet`](dotnet) | ASP.NET Core minimal API | .NET Core buildpack |
| [`ruby-apt`](ruby-apt) | Ruby needing `libvips` from apt | `Aptfile` installs system packages |
| [`revision`](revision) | prints the deployed commit | `REVISION` set by the platform |
| [`sinatra-react`](sinatra-react) | Sinatra API + React frontend | Dockerfile (multi-stage) |

## What they show

- **No Dockerfile needed.** Buildpacks detect the language; `shpyrd.yaml` only carries what
  detection cannot guess (`BP_*` build variables, instance sizes, health checks).
- **Who is visiting.** The edge sets `X-Shpyrd-User` for signed-in visitors; every app prints
  it. Projects created with `--public` skip sign-in.
- **Where it runs.** `SHPYRD_PROJECT`, `SHPYRD_WORKSPACE` and `REVISION` are set on every
  process.
- **Instance sizes.** The default (`shared-s`, 64Mi) fits Go and static sites; Ruby, Python,
  Node and PHP want `shared-m`, the JVM `shared-l`.
- **Release phase.** A `release:` line in the Procfile (see `rails`) runs before each new
  release rolls out; if it fails, the previous release keeps serving.
- **System packages.** An `Aptfile` (see `ruby-apt`) lists Ubuntu packages to install into the
  image.

## License

MIT. Copy anything here into your own projects.
