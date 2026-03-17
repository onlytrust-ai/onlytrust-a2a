# frozen_string_literal: true

FactoryBot.define do
  factory :manifest do
    agent_id { BSON::ObjectId.new }
    name { Faker::App.name }
    version { Faker::App.semantic_version }
    content_hash { Digest::SHA256.hexdigest(SecureRandom.hex) }
    status { "pending_anchor" }
    verification_method { "schema" }
    input_schema { { type: "object" } }
    output_schema { { type: "object" } }
    pricing { { amount: 10, currency: "USDC" } }
  end
end
