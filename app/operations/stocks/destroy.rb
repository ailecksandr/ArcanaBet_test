# frozen_string_literal: true

module Stocks
  class Destroy < ::Callable
    def initialize(stock_id:)
      @stock_id = stock_id
    end

    def call
      Stock.find_by(id: stock_id).destroy
    end

    private

    attr_reader :stock_id
  end
end
