# frozen_string_literal: true

module Api
  module V1
    class IntegrationPermissionsController < ApplicationController
      before_action :set_permission, only: %i[show update destroy]

      def index
        permissions = IntegrationPermission.where(
          "$or" => [
            { requester_agent_id: current_agent.id },
            { provider_agent_id: current_agent.id }
          ]
        )
        render json: permissions
      end

      def show
        render json: @permission
      end

      def create
        permission = IntegrationPermission.new(permission_params)
        permission.requester_agent_id = current_agent.id

        if permission.save
          render json: permission, status: :created
        else
          render json: { errors: permission.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @permission.update(permission_params)
          render json: @permission
        else
          render json: { errors: @permission.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @permission.destroy
        head :no_content
      end

      private

      def set_permission
        @permission = IntegrationPermission.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render_not_found
      end

      def permission_params
        params.permit(:provider_agent_id, :status)
      end
    end
  end
end
