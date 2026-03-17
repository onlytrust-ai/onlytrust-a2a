# frozen_string_literal: true

module Verification
  class PipelineService < ApplicationService
    def initialize(task:)
      @task = task
    end
  end
end
