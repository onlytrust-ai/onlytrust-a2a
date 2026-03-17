# frozen_string_literal: true

class ReputationUpdateWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3

  def perform(agent_id, task_id)
    raise NotImplementedError, "ReputationUpdateWorker not implemented"
  end
end
