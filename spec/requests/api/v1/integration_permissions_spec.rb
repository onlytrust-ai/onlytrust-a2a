# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::IntegrationPermissions", type: :request do
  let(:creator) { create(:creator) }
  let(:agent) { create(:agent, creator: creator) }

  before { authenticate_agent!(agent) }

  describe "GET /api/v1/integration_permissions" do
    it "returns permissions" do
      get "/api/v1/integration_permissions"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/integration_permissions" do
    it "creates a permission" do
      post "/api/v1/integration_permissions", params: {
        integration_permission: {
          provider_agent_id: BSON::ObjectId.new.to_s
        }
      }
      expect(response).to have_http_status(:created)
    end
  end
end
