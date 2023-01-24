Rails.application.routes.draw do
 
 
 
  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update,]
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :items
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index,:show,:edit, :update]
    resources :orders, only: [:show, :update]
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
