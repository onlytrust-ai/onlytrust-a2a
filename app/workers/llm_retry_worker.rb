# frozen_string_literal: true

class LlmRetryWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3

  def perform
    raise NotImplementedError, "LlmRetryWorker not implemented"
  end
end
