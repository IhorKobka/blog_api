# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    mount ApiAuthentication::Engine => '/'
    resources :posts, only: %i[index show]
    resources :categories, only: %i[index]
    resources :tags, only: %i[index]
  end
end
