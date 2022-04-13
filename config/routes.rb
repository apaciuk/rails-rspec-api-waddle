# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: %i[index create show update destroy]
      resources :categories, only: %i[create destroy]
    end
  end
end
