Rails.application.routes.draw do

  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
    resources :customers, only: [:show, :edit, :update,]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders ,only: [:new, :index, :show,:create]
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :items
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index,:show,:edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  devise_for :customers,skip: [:passwords], controllers:{
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

   devise_for :admin, sikp: [:registrations, :passwords] ,controllers:{
    sessions: 'admin/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
