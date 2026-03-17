# frozen_string_literal: true

module Api
  module V1
    module Webhooks
      class BaseEventsController < ApplicationController
        skip_before_action :authenticate_agent!

        def create
          event = WebhookEvent.create!(
            event_type: params[:event_type],
            payload: params[:payload]&.to_unsafe_h || {}
          )
          render json: { id: event.id, status: "received" }, status: :accepted
        end
      end
    end
  end
end
