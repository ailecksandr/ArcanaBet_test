# frozen_string_literal: true

module Stocks
  class IndexFacade
    include Pagy::Backend

    PER_PAGE     = 10
    DEFAULT_PAGE = 1

    def initialize(params:, user:)
      @params = params
      @user   = user
    end

    def stocks
      @stocks ||= paginated_stocks.second
    end

    def pagination
      @pagination ||= paginated_stocks.first
    end

    def page_counter
      PER_PAGE * (page.to_i - 1) + 1
    end

    private

    attr_reader :user, :params

    def paginated_stocks
      @paginated_stocks ||= pagy(Stock.where(user: user),
                                 page:  page,
                                 items: PER_PAGE)
    end

    def page
      params.fetch(:page, DEFAULT_PAGE)
    end
  end
end
