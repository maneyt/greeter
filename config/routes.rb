Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to: "greetings#show"
  resources :greetings, only: [:show, :create]
end
