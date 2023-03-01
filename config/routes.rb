# frozen_string_literal: true

Rails.application.routes.draw do

  resources :applicants do
    member do
      get "versions", to: "applicants#versions"
    end
  end
  resources :funds
  resources :payments, only: [:index]
  resources :projects

  root 'applicants#index'

end
