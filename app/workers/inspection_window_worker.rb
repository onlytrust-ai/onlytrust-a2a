# frozen_string_literal: true

class InspectionWindowWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3

  def perform
    raise NotImplementedError, "InspectionWindowWorker not implemented"
  end
end
