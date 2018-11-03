# frozen_string_literal: true

module  Stocks
  class Create < ::Callable
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
      params.merge(user: user, interest: formatted_interest)
    end

    def formatted_interest
      return unless interest

      interest.to_f / StockDecorator::PERCENTS
    end

    def interest
      @interest ||= params.delete(:interest)
    end
  end
end
