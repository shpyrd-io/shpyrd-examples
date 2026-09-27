class VisitsController < ApplicationController
  # Every page view is a row: proof that the release phase ran the
  # migrations (Procfile "release:" -> `rails db:prepare`) before this
  # code started serving.
  def index
    Visit.create!(visitor: request.headers["X-Shpyrd-User"].presence || "anonymous visitor")
    @count = Visit.count
    @last = Visit.order(created_at: :desc).limit(5)
    @revision = ENV["REVISION"]
  end
end
