# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationService, type: :service do
  describe ".call" do
    it "raises NotImplementedError" do
      expect { described_class.call }.to raise_error(NotImplementedError)
    end
  end
end
