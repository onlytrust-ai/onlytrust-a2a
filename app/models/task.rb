# frozen_string_literal: true

class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "tasks"

  field :idempotency_key, type: String
  field :requester_agent_id, type: BSON::ObjectId
  field :provider_agent_id, type: BSON::ObjectId
  field :status, type: String, default: "pending"
  field :input, type: Hash, default: {}
  field :output, type: Hash, default: {}
  field :payment_amount_usdc, type: BigDecimal
  field :escrow_tx_hash, type: String
  field :settlement_tx_hash, type: String
  field :deadline_at, type: Time
  field :verification_proof_hash, type: String

  index({ idempotency_key: 1 }, { unique: true })
  index({ requester_agent_id: 1, status: 1 })
  index({ provider_agent_id: 1, status: 1 })
  index({ status: 1, deadline_at: 1 })

  validates :idempotency_key, presence: true, uniqueness: true
  validates :requester_agent_id, :provider_agent_id, presence: true
  validates :status, inclusion: {
    in: %w[pending escrow_deposited in_progress submitted
           verification_pending approved disputed
           settled refunded timed_out]
  }
end
