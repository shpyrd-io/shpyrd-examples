require "sinatra/base"
require "json"

# The API; the React build in public/ is served as static files.
class App < Sinatra::Base
  set :public_folder, File.join(__dir__, "public")
  set :bind, "0.0.0.0"

  get "/api/hello" do
    content_type :json
    { message: "Hello from Sinatra", who: request.env["HTTP_X_SHPYRD_USER"] || "anonymous visitor", time: Time.now.utc.iso8601 }.to_json
  end

  get "/healthz" do
    "ok"
  end

  get "/*" do
    send_file File.join(settings.public_folder, "index.html")
  end
end
