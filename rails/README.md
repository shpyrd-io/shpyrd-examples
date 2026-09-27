# example-rails

Rails 8 (`--minimal`, PostgreSQL). Shows the release phase: the `Procfile` has a
`release:` line, so `rails db:prepare` runs before every new release rolls out.

```sh
shpyrd projects create example-rails --public
shpyrd pg create db --project example-rails
shpyrd attach db --project example-rails
shpyrd secrets set SECRET_KEY_BASE=$(openssl rand -hex 64) --project example-rails
shpyrd deploy
```
