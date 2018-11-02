# frozen_string_literal: true

module  Stocks
  class Create < ::Callable
    def initialize(user:, params:)
      @user   = user
      @params = params
    end

    def call
      create_stock
    end

    private

    attr_reader :params, :user

    def create_stock
      Stock.create(stock_params)
    end

    def stock_params
      params.merge(user: user)
    end
  end
end
