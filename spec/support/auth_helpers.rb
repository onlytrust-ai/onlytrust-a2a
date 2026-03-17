# frozen_string_literal: true

module AuthHelpers
  def auth_headers(agent)
    { "Authorization" => "Bearer test_#{agent.api_key_prefix}_key" }
  end

  def authenticate_agent!(agent)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_agent!)
    allow_any_instance_of(ApplicationController).to receive(:current_agent).and_return(agent)
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
  config.include AuthHelpers, type: :controller
end
