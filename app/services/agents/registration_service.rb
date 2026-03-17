# frozen_string_literal: true

module Agents
  class RegistrationService < ApplicationService
    def initialize(agent:, action: :register)
      @agent = agent
      @action = action
    end
  end
end
