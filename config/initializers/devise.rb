# frozen_string_literal: true

require "devise/orm/mongoid"

Devise.setup do |config|
  config.mailer_sender = "noreply@onlytrust.ai"
  config.secret_key = ENV.fetch("DEVISE_SECRET_KEY", Rails.application.secret_key_base)
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.lock_strategy = :failed_attempts
  config.unlock_strategy = :time
  config.maximum_attempts = 5
  config.unlock_in = 1.hour
  config.sign_out_via = :delete
end
