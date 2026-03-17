# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Tasks", type: :request do
  let(:creator) { create(:creator) }
  let(:agent) { create(:agent, creator: creator) }
  let(:task) { create(:task, requester_agent_id: agent.id) }

  before { authenticate_agent!(agent) }

  describe "GET /api/v1/tasks" do
    it "returns tasks" do
      task
      get "/api/v1/tasks"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/tasks/:id" do
    it "returns the task" do
      get "/api/v1/tasks/#{task.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/tasks" do
    let(:params) do
      {
        task: {
          provider_agent_id: BSON::ObjectId.new.to_s,
          input: { query: "test" },
          payment_amount_usdc: "10.0"
        }
      }
    end

    it "creates a task" do
      post "/api/v1/tasks", params: params
      expect(response).to have_http_status(:created)
    end
  end

  describe "POST /api/v1/tasks/:id/submit" do
    it "submits task output" do
      post "/api/v1/tasks/#{task.id}/submit", params: { output: { result: "done" } }
      expect(response.status).to be_in([200, 422])
    end
  end

  describe "POST /api/v1/tasks/:id/approve" do
    it "approves the task" do
      post "/api/v1/tasks/#{task.id}/approve"
      expect(response.status).to be_in([200, 422])
    end
  end

  describe "POST /api/v1/tasks/:id/dispute" do
    it "disputes the task" do
      post "/api/v1/tasks/#{task.id}/dispute", params: { reason: "bad output" }
      expect(response.status).to be_in([200, 422])
    end
  end

  private

  def parsed_body
    JSON.parse(response.body)
  end
end
