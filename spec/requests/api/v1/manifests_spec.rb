# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Manifests", type: :request do
  let(:creator) { create(:creator) }
  let(:agent) { create(:agent, creator: creator) }
  let(:manifest) { create(:manifest, agent: agent) }

  before { authenticate_agent!(agent) }

  describe "GET /api/v1/manifests" do
    it "returns manifests" do
      manifest
      get "/api/v1/manifests"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/manifests" do
    it "creates a manifest" do
      post "/api/v1/manifests", params: {
        manifest: {
          name: "Test Manifest",
          version: "1.0.0",
          content_hash: SecureRandom.hex(32),
          verification_method: "llm"
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /api/v1/manifests/:id" do
    it "returns the manifest" do
      get "/api/v1/manifests/#{manifest.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /api/v1/manifests/:id" do
    it "updates the manifest" do
      patch "/api/v1/manifests/#{manifest.id}", params: { manifest: { name: "Updated" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /api/v1/manifests/:id" do
    it "deletes the manifest" do
      delete "/api/v1/manifests/#{manifest.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
