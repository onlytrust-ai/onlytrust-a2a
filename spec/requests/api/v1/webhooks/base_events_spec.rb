# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Webhooks::BaseEvents", type: :request do
  describe "POST /api/v1/webhooks/base_events" do
    it "accepts a webhook event" do
      post "/api/v1/webhooks/base_events", params: {
        base_event: { event_type: "escrow_deposited", payload: { tx_hash: "0xabc" } }
      }
      expect(response).to have_http_status(:accepted)
    end
  end
end
