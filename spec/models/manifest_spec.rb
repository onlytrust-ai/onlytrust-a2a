# frozen_string_literal: true

require "rails_helper"

RSpec.describe Manifest, type: :model do
  describe "fields" do
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to have_field(:version).of_type(String) }
    it { is_expected.to have_field(:content_hash).of_type(String) }
    it { is_expected.to have_field(:status).of_type(String).with_default_value_of("pending_anchor") }
  end

  describe "associations" do
    it { is_expected.to belong_to(:agent).of_type(Onlytrust::Core::Agent) }
  end

  describe "indexes" do
    it { is_expected.to have_index_for(content_hash: 1).with_options(unique: true) }
  end
end
