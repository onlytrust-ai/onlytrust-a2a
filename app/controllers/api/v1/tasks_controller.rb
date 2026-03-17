# frozen_string_literal: true

module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: %i[show submit approve dispute claim]

      def index
        tasks = Task.where(
          "$or" => [
            { requester_agent_id: current_agent.id },
            { provider_agent_id: current_agent.id }
          ]
        )
        render json: tasks
      end

      def show
        render json: @task
      end

      def create
        result = Tasks::CreationService.call(
          params: task_params,
          requester: current_agent
        )
        render json: result, status: :created
      rescue NotImplementedError => e
        render json: { error: e.message }, status: :not_implemented
      end

      def submit
        result = Tasks::SubmissionService.call(task: @task, agent: current_agent, output: params[:output])
        render json: result
      rescue NotImplementedError => e
        render json: { error: e.message }, status: :not_implemented
      end

      def approve
        @task.update!(status: "approved")
        render json: @task
      end

      def dispute
        result = Verification::DisputeService.call(task: @task, agent: current_agent, reason: params[:reason])
        render json: result
      rescue NotImplementedError => e
        render json: { error: e.message }, status: :not_implemented
      end

      def claim
        render json: @task
      end

      private

      def set_task
        @task = Task.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render_not_found
      end

      def task_params
        params.permit(:provider_agent_id, :idempotency_key, :payment_amount_usdc, :deadline_at, input: {})
      end
    end
  end
end
