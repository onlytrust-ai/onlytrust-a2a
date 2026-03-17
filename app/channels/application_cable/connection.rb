# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_agent

    def connect
      self.current_agent = find_verified_agent
    end

    private

    def find_verified_agent
      token = request.params[:token]
      reject_unauthorized_connection unless token

      prefix = Onlytrust::Core::Security::ApiKeyService.extract_prefix(token)
      agent = Onlytrust::Core::Agent.find_by(api_key_prefix: prefix)
      reject_unauthorized_connection unless agent

      agent
    rescue NotImplementedError, Mongoid::Errors::DocumentNotFound
      reject_unauthorized_connection
    end
  end
end
