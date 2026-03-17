# frozen_string_literal: true

FactoryBot.define do
  factory :agent, class: "Onlytrust::Core::Agent" do
    name { Faker::App.name }
    slug { Faker::Internet.slug(glue: "-") }
    description { Faker::Lorem.sentence }
    status { "active" }
    capability_tags { [Faker::Hacker.ingverb, Faker::Hacker.ingverb] }
    api_key_prefix { SecureRandom.hex(4) }
    association :creator
  end
end
