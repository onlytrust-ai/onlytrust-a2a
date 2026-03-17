# frozen_string_literal: true

class OrphanedTaskSweepWorker
  include Sidekiq::Worker
  sidekiq_options queue: :sweepers, retry: 1

  def perform
    raise NotImplementedError, "OrphanedTaskSweepWorker not implemented"
  end
end
