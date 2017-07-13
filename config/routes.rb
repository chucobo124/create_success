Rails.application.routes.draw do
  root to: 'home#index'
  get '/csm36v' , to: 'home#csm36v'
  get '/csl210v' , to: 'home#csl210v'
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
  get '/news/example', to: 'news#news_example'
  get '/product', to: 'product_pages#index'
  get '/faq/faq_example', to: 'faq#faq_example'
  namespace :admin do
    root 'home#index'
    resources 'product_catelogs'
    resources 'products'
    resources 'news'
    resources 'faq_category' do
      resources 'faq'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
