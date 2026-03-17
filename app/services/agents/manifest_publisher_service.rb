# frozen_string_literal: true

module Agents
  class ManifestPublisherService < ApplicationService
    def initialize(agent:, manifest_params:)
      @agent = agent
      @manifest_params = manifest_params
    end
  end
end
