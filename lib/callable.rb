# frozen_string_literal: true

class Callable
  include MandatoryMethods

  def self.call(*args)
    new(*args).call.tap do |result|
      return yield(result) if block_given?
    end
  end
end
