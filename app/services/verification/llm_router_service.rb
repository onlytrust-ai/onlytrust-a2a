# frozen_string_literal: true

module Verification
  class LlmRouterService < ApplicationService
    def initialize(task:, verification_method:)
      @task = task
      @verification_method = verification_method
    end
  end
end
