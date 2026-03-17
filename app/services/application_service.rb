# frozen_string_literal: true

class ApplicationService
  def self.call(...)
    new(...).call
  end

  def call
    raise NotImplementedError, "#{self.class}#call not implemented"
  end
end
