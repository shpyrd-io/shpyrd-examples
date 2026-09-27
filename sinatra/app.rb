require "sinatra/base"

# A Sinatra app: the Ruby buildpack installs the bundle and runs the
# Procfile's web process (puma via rackup).
class App < Sinatra::Base
  set :bind, "0.0.0.0"

  get "/" do
    who = request.env["HTTP_X_SHPYRD_USER"] || "anonymous visitor"
    content_type :html
    <<~HTML
      <!doctype html><html lang="en"><head><meta charset="utf-8"><title>example-sinatra</title>
      <style>body{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}code{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}</style></head>
      <body><h1>Sinatra on shpyrd</h1>
      <p>Hello, <code>#{Rack::Utils.escape_html(who)}</code>. Ruby #{RUBY_VERSION}, Sinatra #{Sinatra::VERSION}.</p>
      <p>Project <code>#{ENV["SHPYRD_PROJECT"]}</code>, workspace <code>#{ENV["SHPYRD_WORKSPACE"]}</code>.</p></body></html>
    HTML
  end

  get "/healthz" do
    "ok"
  end
end
