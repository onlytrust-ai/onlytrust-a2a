source "https://rubygems.org"

gem "rails", "~> 7.2.3"
gem "puma", ">= 5.0"
gem "dotenv-rails", groups: [:development, :test]
gem "tzinfo-data", platforms: %i[windows jruby]

# OnlyTrust Core
gem "onlytrust-core", path: "../onlytrust-core"

# Database
gem "mongoid", "~> 9.0"

# Authentication
gem "devise", "~> 5.0"

# Background Jobs
gem "sidekiq", "~> 7.3"
gem "sidekiq-cron", "~> 2.3"

# API
gem "rack-cors"
gem "oj", "~> 3.16"
gem "jwt", "~> 3.1"

# Blockchain (requires libsecp256k1 — install via: brew install secp256k1)
# gem "eth", "~> 0.5"

# Redis
gem "redis", "~> 5.0"

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0"
  gem "factory_bot_rails", "~> 6.4"
  gem "faker", "~> 3.4"
  gem "mongoid-rspec", "~> 4.2"
  gem "database_cleaner-mongoid", "~> 2.0"
  gem "webmock", "~> 3.23"
  gem "vcr", "~> 6.3"
  gem "simplecov", require: false
end
