# frozen_string_literal: true

class OnChainEventIndexerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :blockchain, retry: 3

  def perform(event_data)
    raise NotImplementedError, "OnChainEventIndexerWorker not implemented"
  end
end
