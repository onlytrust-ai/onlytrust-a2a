# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000",
            "https://app.onlytrust.ai",
            "https://api.onlytrust.ai"

    resource "*",
             headers: :any,
             methods: %i[get post put patch delete options head],
             expose: %w[X-Request-Id X-Total-Count],
             max_age: 600
  end
end
