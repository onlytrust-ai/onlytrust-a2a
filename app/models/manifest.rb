# frozen_string_literal: true

class Manifest
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "manifests"

  field :agent_id, type: BSON::ObjectId
  field :name, type: String
  field :version, type: String
  field :content_hash, type: String
  field :status, type: String, default: "pending_anchor"
  field :on_chain_hash, type: String
  field :input_schema, type: Hash, default: {}
  field :output_schema, type: Hash, default: {}
  field :pricing, type: Hash, default: {}
  field :verification_method, type: String

  belongs_to :agent, class_name: "Onlytrust::Core::Agent", optional: true

  index({ content_hash: 1 }, { unique: true })
  index({ agent_id: 1, status: 1 })
  index({ status: 1 })

  validates :name, :version, :content_hash, presence: true
  validates :content_hash, uniqueness: true
  validates :status, inclusion: { in: %w[pending_anchor active revoked] }
end
