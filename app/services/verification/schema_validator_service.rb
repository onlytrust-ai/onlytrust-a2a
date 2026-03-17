# frozen_string_literal: true

module Verification
  class SchemaValidatorService < ApplicationService
    def initialize(schema:, data:)
      @schema = schema
      @data = data
    end
  end
end
