# frozen_string_literal: true

class AgentJuryWorker
  include Sidekiq::Worker
  sidekiq_options queue: :verification, retry: 3

  def perform(task_id)
    raise NotImplementedError, "AgentJuryWorker not implemented"
  end
end
