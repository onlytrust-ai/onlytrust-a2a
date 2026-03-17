# frozen_string_literal: true

module Verification
  class DisputeService < ApplicationService
    def initialize(task:, agent:, reason:)
      @task = task
      @agent = agent
      @reason = reason
    end
  end
end
