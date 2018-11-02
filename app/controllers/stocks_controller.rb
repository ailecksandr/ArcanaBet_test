# frozen_string_literal: true

class StocksController < ApplicationController
  def index
    @stocks = Stock.where(user_id: current_user)
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = ::Stocks::Create.call(user: current_user, params: stock_params)

    return redirect_to root_path, notice: 'Stock saved' if @stock.valid?

    render :new
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :unit_price, :interest, :duration)
  end
end
