# frozen_string_literal: true

module Assets
  class General < Assets::Base
    def path
      "#{ROOT}/#{controller}"
    end
  end
end
