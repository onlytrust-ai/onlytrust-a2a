# frozen_string_literal: true

class JuryPatternMonitorWorker
  include Sidekiq::Worker
  sidekiq_options queue: :low, retry: 1

  def perform
    raise NotImplementedError, "JuryPatternMonitorWorker not implemented"
  end
end
