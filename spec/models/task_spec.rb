# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model do
  describe "fields" do
    it { is_expected.to have_field(:idempotency_key).of_type(String) }
    it { is_expected.to have_field(:status).of_type(String).with_default_value_of("pending") }
    it { is_expected.to have_field(:input).of_type(Hash) }
    it { is_expected.to have_field(:output).of_type(Hash) }
    it { is_expected.to have_field(:payment_amount_usdc).of_type(BigDecimal) }
  end

  describe "indexes" do
    it { is_expected.to have_index_for(idempotency_key: 1).with_options(unique: true) }
    it { is_expected.to have_index_for(requester_agent_id: 1, status: 1) }
    it { is_expected.to have_index_for(provider_agent_id: 1, status: 1) }
  end

  describe "statuses" do
    it "defines valid statuses" do
      expect(Task.validators_on(:status).first.options[:in]).to include("pending", "submitted", "approved", "disputed")
    end
  end
end
