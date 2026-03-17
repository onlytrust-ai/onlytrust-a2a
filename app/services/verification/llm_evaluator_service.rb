# frozen_string_literal: true

module Verification
  class LlmEvaluatorService < ApplicationService
    def initialize(task:, provider:)
      @task = task
      @provider = provider
    end
  end
end
