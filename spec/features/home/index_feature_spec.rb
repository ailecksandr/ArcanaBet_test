# frozen_string_literal: true

require 'rails_helper'

feature 'Stocks #index', js: true do
  before { visit root_path }

  context 'when registration form is active' do
    scenario 'shows registration form' do
      expect(page).to have_css('.js-register-form')
    end

    scenario 'have all input fields' do
      within('.js-register-form') do
        expect(page).to have_css('#user_email')
        expect(page).to have_css('#user_password')
        expect(page).to have_css('#user_password_confirmation')
      end
    end
  end

  context 'when click change form button' do
    scenario 'shows sign in page' do
      find('.js-switch-form').click

      expect(page).to have_css('.js-sign-in-form')
    end

    scenario 'have all input fields' do
      find('.js-switch-form').click

      within('.js-sign-in-form') do
        expect(page).to have_css('#user_email')
        expect(page).to have_css('#user_password')
      end
    end
  end
end
