# frozen_string_literal: true

require 'rails_helper'

feature 'Stocks #index', js: true do
  let(:user)        { create(:user) }
  let!(:stock)      { create_list(:stock, 3, user: user) }
  let(:last_stock)  { user.stock.first }

  context 'when user signed in' do
    before do
      sign_in user

      visit stocks_path
    end

    scenario 'shows a list of stocks' do
      expect(page).to have_css('a.show-link', count: 3)
    end

    scenario 'shows delete link for stock item' do
      within('.table-responsive') do
        expect(page).to have_css('a.delete-link')
      end
    end

    scenario 'shows show link for stock item' do
      within('.table-responsive') do
        expect(page).to have_css('a.show-link')
      end
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
