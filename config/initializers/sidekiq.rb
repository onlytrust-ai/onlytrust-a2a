# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: REDIS_POOLS[:sidekiq], namespace: "onlytrust_a2a" }

  config.on(:startup) do
    schedule_file = Rails.root.join("config", "sidekiq_cron.yml")
    if File.exist?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash!(YAML.load_file(schedule_file))
    end
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_POOLS[:sidekiq], namespace: "onlytrust_a2a" }
end
