# frozen_string_literal: true

# Redis DB segregation:
# DB 0 - Sidekiq
# DB 1 - Rate limits
# DB 2 - Response cache
# DB 3 - Action Cable
# DB 4 - Idempotency keys
# DB 5 - EIP-712 signatures
# DB 6 - Chain reconciliation
# DB 7 - Feature flags

REDIS_BASE_URL = ENV.fetch("REDIS_URL", "redis://localhost:6379")

REDIS_POOLS = {
  sidekiq: "#{REDIS_BASE_URL}/0",
  rate_limits: "#{REDIS_BASE_URL}/1",
  cache: "#{REDIS_BASE_URL}/2",
  action_cable: "#{REDIS_BASE_URL}/3",
  idempotency: "#{REDIS_BASE_URL}/4",
  eip712: "#{REDIS_BASE_URL}/5",
  chain_reconciliation: "#{REDIS_BASE_URL}/6",
  feature_flags: "#{REDIS_BASE_URL}/7"
}.freeze

Rails.application.config.cache_store = :redis_cache_store, { url: REDIS_POOLS[:cache] }
