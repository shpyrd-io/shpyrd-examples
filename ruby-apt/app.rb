require "sinatra/base"

# Sinatra with a system library: libvips from the Aptfile, used through
# the ruby-vips gem. Without the package the require below fails.
class App < Sinatra::Base
  set :bind, "0.0.0.0"

  get "/" do
    vips = begin
      require "vips"
      "libvips #{Vips.version_string} is installed (from the Aptfile)"
    rescue LoadError => e
      "libvips is missing: #{e.message}"
    end
    content_type :html
    <<~HTML
      <!doctype html><html lang="en"><head><meta charset="utf-8"><title>example-ruby-apt</title>
      <style>body{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}code{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}</style></head>
      <body><h1>Ruby + system packages</h1><p>#{Rack::Utils.escape_html(vips)}</p>
      <p>Project <code>#{ENV["SHPYRD_PROJECT"]}</code>, workspace <code>#{ENV["SHPYRD_WORKSPACE"]}</code>.</p></body></html>
    HTML
  end

  get "/healthz" do
    "ok"
  end
end
