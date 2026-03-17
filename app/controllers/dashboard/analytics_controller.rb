# frozen_string_literal: true

module Dashboard
  class AnalyticsController < ApplicationController
    def index
      render json: {
        total_agents: Onlytrust::Core::Agent.count,
        total_tasks: Task.count,
        active_tasks: Task.where(status: "in_progress").count
      }
    end
  end
end
