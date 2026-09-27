# Two toolchains in one image, which buildpacks do not compose: a Dockerfile
# does. Stage 1 builds the React frontend, stage 2 runs Sinatra serving the
# API and the built files.
FROM node:22-alpine AS frontend
WORKDIR /src/frontend
COPY frontend/package.json ./
RUN npm install --no-audit --no-fund
COPY frontend/ ./
RUN npm run build

FROM ruby:3.4-slim
WORKDIR /app
ENV RACK_ENV=production BUNDLE_WITHOUT=development
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY app.rb config.ru ./
COPY --from=frontend /src/frontend/dist ./public
# shpyrd runs images as a numeric non-root user.
RUN useradd -u 1000 -m app && chown -R app /app
USER 1000
EXPOSE 8080
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "8080"]
