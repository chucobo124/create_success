Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :admin do
    root 'home#index'
    resource 'products'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
