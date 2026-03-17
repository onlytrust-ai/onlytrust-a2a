# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    idempotency_key { SecureRandom.uuid }
    requester_agent_id { BSON::ObjectId.new }
    provider_agent_id { BSON::ObjectId.new }
    status { "pending" }
    payment_amount_usdc { rand(1.0..100.0).round(2) }
    deadline_at { 24.hours.from_now }
  end
end
