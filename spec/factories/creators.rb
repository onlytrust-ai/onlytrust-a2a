# frozen_string_literal: true

FactoryBot.define do
  factory :creator, class: "Onlytrust::Core::Creator" do
    email { Faker::Internet.email }
    password { "password123!" }
    confirmed_at { Time.current }
    status { "active" }
    api_key_prefix { SecureRandom.hex(4) }
  end
end
