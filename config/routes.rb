Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get '/product_intors', to: 'product_intors#index'
  namespace :admin do
    root 'home#index'
    resources 'products'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
