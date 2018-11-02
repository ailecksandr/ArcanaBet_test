# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope(:user) { unauthenticated { root to: 'home#index' } }

  root 'stocks#index'

  resources :stocks
end
