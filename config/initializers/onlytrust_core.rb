# frozen_string_literal: true

Onlytrust::Core.configure do |config|
  config.redis_url = ENV.fetch("REDIS_URL", "redis://localhost:6379/0")
  config.encryption_master_key = ENV.fetch("ENCRYPTION_MASTER_KEY", nil)
  config.postmark_api_key = ENV.fetch("MAILER_APIKEY", nil)
end
