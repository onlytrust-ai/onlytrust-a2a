# frozen_string_literal: true

module Tasks
  class TimeoutService < ApplicationService
    def initialize(task:)
      @task = task
    end
  end
end
