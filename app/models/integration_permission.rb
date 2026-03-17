# frozen_string_literal: true

class IntegrationPermission
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "integration_permissions"

  field :requester_agent_id, type: BSON::ObjectId
  field :provider_agent_id, type: BSON::ObjectId
  field :status, type: String, default: "pending"

  index(
    { requester_agent_id: 1, provider_agent_id: 1 },
    { unique: true }
  )
  index({ status: 1 })

  validates :requester_agent_id, :provider_agent_id, presence: true
  validates :status, inclusion: { in: %w[pending approved rejected revoked] }
end
