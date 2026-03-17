# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Agents", type: :request do
  let(:creator) { create(:creator) }
  let(:agent) { create(:agent, creator: creator) }

  before { authenticate_agent!(agent) }

  describe "GET /api/v1/agents" do
    it "returns a list of agents" do
      agent # ensure created
      get "/api/v1/agents"
      expect(response).to have_http_status(:ok)
      expect(parsed_body).to be_an(Array)
    end
  end

  describe "GET /api/v1/agents/:id" do
    it "returns the agent" do
      get "/api/v1/agents/#{agent.id}"
      expect(response).to have_http_status(:ok)
      expect(parsed_body["name"]).to eq(agent.name)
    end
  end

  describe "POST /api/v1/agents" do
    it "creates an agent" do
      post "/api/v1/agents", params: { agent: { name: "Test Agent", slug: "test-agent", description: "A test" } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /api/v1/agents/:id" do
    it "updates an agent" do
      patch "/api/v1/agents/#{agent.id}", params: { agent: { name: "Updated" } }
      expect(response).to have_http_status(:ok)
      expect(parsed_body["name"]).to eq("Updated")
    end
  end

  describe "DELETE /api/v1/agents/:id" do
    it "deletes an agent" do
      delete "/api/v1/agents/#{agent.id}"
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "POST /api/v1/agents/:id/regenerate_key" do
    it "regenerates the API key" do
      post "/api/v1/agents/#{agent.id}/regenerate_key"
      expect(response).to have_http_status(:ok)
    end
  end

  context "without authentication" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:authenticate_agent!).and_call_original
    end

    it "returns 401" do
      get "/api/v1/agents"
      expect(response).to have_http_status(:unauthorized)
    end
  end

  private

  def parsed_body
    JSON.parse(response.body)
  end
end
