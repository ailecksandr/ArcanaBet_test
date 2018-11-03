# frozen_string_literal: true

class StocksController < ApplicationController
  decorates_assigned :interest

  def index
    @facade = ::Stocks::IndexFacade.new(params: params, user: current_user)
  end

  def show
    @facade = ::Stocks::ShowFacade.new(stock_id: params[:id])
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = ::Stocks::Create.call(user: current_user, params: stock_params)

    return render :new unless @stock.valid?

    redirect_to root_path, notice: I18n.t('stocks.create.successfully_created')
  end

  def destroy
    ::Stocks::Destroy.call(stock_id: params[:id])

    redirect_to root_path, notice: I18n.t('stocks.index.successfully_deleted')
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :unit_price, :interest, :duration)
  end
end
