Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get '/product_catelogs', to: 'product_catelogs#index'
  get '/contact_us', to: 'contact_us#index'
  get '/about_us', to: 'about_us#index'
  namespace :admin do
    root 'home#index'
    resources 'products'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
