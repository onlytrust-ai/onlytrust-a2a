# frozen_string_literal: true

class EscrowInitiationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :blockchain, retry: 3

  def perform(task_id)
    raise NotImplementedError, "EscrowInitiationWorker not implemented"
  end
end
