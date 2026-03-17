# frozen_string_literal: true

module Payments
  class EscrowService < ApplicationService
    def initialize(task:)
      @task = task
    end
  end
end
