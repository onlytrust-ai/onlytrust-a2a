# frozen_string_literal: true

module Tasks
  class SubmissionService < ApplicationService
    def initialize(task:, agent:, output:)
      @task = task
      @agent = agent
      @output = output
    end
  end
end
