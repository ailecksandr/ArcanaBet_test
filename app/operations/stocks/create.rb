# frozen_string_literal: true

module  Stocks
  class Create < ::Callable
    PERCENTS = 100

    def initialize(user:, params:)
      @user   = user
      @params = params
    end

    def call
      Stock.create(stock_params)
    end

    private

    attr_reader :params, :user

    def stock_params
      params.merge(user: user, interest: interest)
    end

    def interest
      params.delete(:interest).to_f / PERCENTS
    end
  end
end
