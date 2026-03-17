# frozen_string_literal: true

module Payments
  class SettlementService < ApplicationService
    def initialize(task:)
      @task = task
    end
  end
end
