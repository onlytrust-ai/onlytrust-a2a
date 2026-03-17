# frozen_string_literal: true

module Blockchain
  class Eip712SignerService < ApplicationService
    def initialize(domain:, types:, message:)
      @domain = domain
      @types = types
      @message = message
    end
  end
end
