# frozen_string_literal: true

module Stocks
  class CompoundInterest < ::Callable
    def initialize(stock_id:)
      @stock_id = stock_id
    end

    def call
      generate_hash
    end

    private

    attr_reader :stock_id

    def generate_hash
      (1..stock.duration).reduce(stock.unit_price, &method(:compound!))

      chart_hash
    end

    def chart_hash
      @chart_hash ||= {}
    end

    def compound!(principal, index)
      chart_hash[index.to_s] = interest_principal(principal)
    end

    def interest_principal(principal)
      (principal * (1 + stock.interest / 100)).round
    end

    def stock
      @stock ||= Stock.find_by(id: stock_id)
    end
  end
end
