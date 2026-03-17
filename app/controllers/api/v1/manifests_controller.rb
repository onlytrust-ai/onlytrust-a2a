# frozen_string_literal: true

module Api
  module V1
    class ManifestsController < ApplicationController
      before_action :set_manifest, only: %i[show update destroy]

      def index
        manifests = Manifest.where(agent_id: current_agent.id)
        render json: manifests
      end

      def show
        render json: @manifest
      end

      def create
        manifest = Manifest.new(manifest_params)
        manifest.agent_id = current_agent.id

        if manifest.save
          render json: manifest, status: :created
        else
          render json: { errors: manifest.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @manifest.update(manifest_params)
          render json: @manifest
        else
          render json: { errors: @manifest.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @manifest.destroy
        head :no_content
      end

      private

      def set_manifest
        @manifest = Manifest.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render_not_found
      end

      def manifest_params
        params.permit(:name, :version, :content_hash, :verification_method, input_schema: {}, output_schema: {}, pricing: {})
      end
    end
  end
end
