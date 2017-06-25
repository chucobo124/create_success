Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get '/product_catelogs', to: 'product_catelogs#index'
  get '/product_catelog/example', to: 'product_catelogs#category_example'
  get '/contact_us', to: 'contact_us#index'
  get '/about_us', to: 'about_us#index'
  get '/faq', to: 'faq#index'
  get '/news', to: 'news#index'
  get '/product', to: 'product_pages#index'
  get '/faq/faq_example', to: 'faq#faq_example'
  namespace :admin do
    root 'home#index'
    resources 'products'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
