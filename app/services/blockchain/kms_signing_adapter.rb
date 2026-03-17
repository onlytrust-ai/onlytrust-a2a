# frozen_string_literal: true

module Blockchain
  class KmsSigningAdapter < ApplicationService
    def initialize(message:)
      @private_key = ENV.fetch("PLATFORM_SIGNER_PRIVATE_KEY", nil)
      @message = message
    end

    def call
      raise NotImplementedError, "On-chain signing requires the eth gem — install via: gem 'eth', '~> 0.5'"
    end
  end
end
