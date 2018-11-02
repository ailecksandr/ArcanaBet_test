# frozen_string_literal: true

module Stocks
  class CompoundInterest < ::Callable
    START_YEAR = 1

    def initialize(stock_id:)
      @stock_id   = stock_id
      @chart_hash = {}
    end

    def call
      (START_YEAR..stock.duration).reduce(stock.unit_price, &method(:compound!))

      chart_hash
    end

    private

    attr_reader :stock_id, :chart_hash

    def compound!(principal, index)
      chart_hash[index] = interest_principal(principal)
    end

    def interest_principal(principal)
      (principal * (1 + stock.interest)).round
    end

    def stock
      @stock ||= Stock.find_by(id: stock_id)
    end
  end
end
