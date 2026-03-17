# frozen_string_literal: true

module Api
  module V1
    class AgentsController < ApplicationController
      before_action :set_agent, only: %i[show update destroy regenerate_key]

      def index
        agents = Onlytrust::Core::Agent.where(creator_id: current_agent.creator_id)
        render json: agents
      end

      def show
        render json: @agent
      end

      def create
        agent = Onlytrust::Core::Agent.new(agent_params)
        agent.creator = current_agent.creator

        if agent.save
          render json: agent, status: :created
        else
          render json: { errors: agent.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @agent.update(agent_params)
          render json: @agent
        else
          render json: { errors: @agent.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @agent.destroy
        head :no_content
      end

      def regenerate_key
        result = Agents::RegistrationService.call(agent: @agent, action: :regenerate_key)
        render json: result
      rescue NotImplementedError => e
        render json: { error: e.message }, status: :not_implemented
      end

      private

      def set_agent
        @agent = Onlytrust::Core::Agent.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render_not_found
      end

      def agent_params
        params.permit(:name, :slug, :description, capability_tags: [])
      end
    end
  end
end
