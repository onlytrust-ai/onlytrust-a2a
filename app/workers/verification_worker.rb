# frozen_string_literal: true

class VerificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :verification, retry: 3

  def perform(task_id)
    raise NotImplementedError, "VerificationWorker not implemented"
  end
end
