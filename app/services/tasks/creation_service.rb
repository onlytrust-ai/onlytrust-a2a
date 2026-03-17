# frozen_string_literal: true

module Tasks
  class CreationService < ApplicationService
    def initialize(params:, requester:)
      @params = params
      @requester = requester
    end
  end
end
