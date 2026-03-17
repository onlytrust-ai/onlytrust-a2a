# frozen_string_literal: true

require "rails_helper"

RSpec.describe WebhookEvent, type: :model do
  describe "fields" do
    it { is_expected.to have_field(:event_type).of_type(String) }
    it { is_expected.to have_field(:payload).of_type(Hash) }
    it { is_expected.to have_field(:status).of_type(String).with_default_value_of("pending") }
    it { is_expected.to have_field(:retry_count).of_type(Integer).with_default_value_of(0) }
  end
end
