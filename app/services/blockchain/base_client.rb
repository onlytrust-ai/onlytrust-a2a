# frozen_string_literal: true

module Blockchain
  class BaseClient < ApplicationService
    def initialize(rpc_url: ENV.fetch("BASE_RPC_URL", "https://sepolia.base.org"))
      @rpc_url = rpc_url
    end
  end
end
