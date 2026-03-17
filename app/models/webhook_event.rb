# frozen_string_literal: true

class WebhookEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "webhook_events"

  field :agent_id, type: BSON::ObjectId
  field :event_type, type: String
  field :payload, type: Hash, default: {}
  field :status, type: String, default: "pending"
  field :retry_count, type: Integer, default: 0
  field :next_retry_at, type: Time

  index({ agent_id: 1, event_type: 1 })
  index({ status: 1, next_retry_at: 1 })

  validates :event_type, presence: true
  validates :status, inclusion: { in: %w[pending delivered failed] }
end
