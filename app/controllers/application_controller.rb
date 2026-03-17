# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_agent!

  private

  def authenticate_agent!
    token = request.headers["Authorization"]&.split("Bearer ")&.last
    return render_unauthorized unless token

    prefix = Onlytrust::Core::Security::ApiKeyService.extract_prefix(token)
    @current_agent = Onlytrust::Core::Agent.find_by(api_key_prefix: prefix)
    return render_unauthorized unless @current_agent

    unless Onlytrust::Core::Security::ApiKeyService.verify(token, @current_agent.api_key_digest)
      render_unauthorized
    end
  rescue NotImplementedError
    render_unauthorized
  end

  def current_agent
    @current_agent
  end

  def render_unauthorized
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def render_not_found
    render json: { error: "Not found" }, status: :not_found
  end
end
