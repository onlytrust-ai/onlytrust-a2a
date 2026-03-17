# frozen_string_literal: true

module Webhooks
  class SignatureService < ApplicationService
    def initialize(payload:, secret:)
      @payload = payload
      @secret = secret
    end
  end
end
