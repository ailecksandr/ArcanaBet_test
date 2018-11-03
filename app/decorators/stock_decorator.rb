# frozen_string_literal: true

class StockDecorator < ApplicationDecorator
  PERCENTS             = 100
  PERCENTAGE_PRECISION = 2

  private *delegate(:number_to_percentage, to: :h)

  def interest(human: nil)
    human ? number_to_percentage(super() * PERCENTS, precision: PERCENTAGE_PRECISION) : super()
  end
end
