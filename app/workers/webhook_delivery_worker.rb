# frozen_string_literal: true

class WebhookDeliveryWorker
  include Sidekiq::Worker
  sidekiq_options queue: :webhooks, retry: 5

  def perform(webhook_event_id)
    raise NotImplementedError, "WebhookDeliveryWorker not implemented"
  end
end
