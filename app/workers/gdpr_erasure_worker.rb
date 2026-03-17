# frozen_string_literal: true

class GdprErasureWorker
  include Sidekiq::Worker
  sidekiq_options queue: :low, retry: 1

  def perform(request_id)
    raise NotImplementedError, "GdprErasureWorker not implemented"
  end
end
