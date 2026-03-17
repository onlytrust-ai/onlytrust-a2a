# frozen_string_literal: true

module Agents
  class TrustPackageBuilderService < ApplicationService
    def initialize(agent:)
      @agent = agent
    end
  end
end
