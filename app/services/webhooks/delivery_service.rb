# frozen_string_literal: true

module Webhooks
  class DeliveryService < ApplicationService
    def initialize(webhook_event:)
      @webhook_event = webhook_event
    end
  end
end
