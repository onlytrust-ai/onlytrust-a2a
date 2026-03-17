# frozen_string_literal: true

module Dashboard
  class AgentsController < ApplicationController
    def index
      agents = Onlytrust::Core::Agent.all
      render json: agents
    end

    def show
      agent = Onlytrust::Core::Agent.find(params[:id])
      render json: agent
    rescue Mongoid::Errors::DocumentNotFound
      render_not_found
    end
  end
end
