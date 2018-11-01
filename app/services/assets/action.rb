# frozen_string_literal: true

module Assets
  class Action < Assets::Base
    private

    def path
      @path ||= "#{ROOT}/#{controller}/#{action}"
    end
  end
end
