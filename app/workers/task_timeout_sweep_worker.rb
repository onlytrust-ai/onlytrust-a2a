# frozen_string_literal: true

class TaskTimeoutSweepWorker
  include Sidekiq::Worker
  sidekiq_options queue: :sweepers, retry: 1

  def perform
    raise NotImplementedError, "TaskTimeoutSweepWorker not implemented"
  end
end
