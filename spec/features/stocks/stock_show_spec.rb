# frozen_string_literal: true

require 'rails_helper'

feature 'Stocks #index', js: true do
  let(:user)       { create(:user) }
  let!(:stock)     { create_list(:stock, 3, user: user) }
  let(:last_stock) { user.stocks.first.decorate }

  context 'when user signed in' do
    before do
      sign_in user

      visit stock_path last_stock
    end

    scenario 'shows stock info' do
      expect(page).to have_content(last_stock.name)
      expect(page).to have_content(last_stock.unit_price)
      expect(page).to have_content(last_stock.interest(human: true))
      expect(page).to have_content(last_stock.duration)
    end

    scenario 'shows chart bar' do
      expect(page).to have_css('#chart')
    end

    scenario 'shows sign out page' do
      expect(page).to have_link('Log out', href: '/users/sign_out')
    end
  end

  context 'when user is not signed in' do
    scenario 'does not show sign out page' do
      expect(page).to have_no_link('Log out', href: '/users/sign_out')
    end
  end
end
