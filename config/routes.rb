Rails.application.routes.draw do
 
  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :items
    resources :genres, only: [:index, :edit, :create, :update]
    
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
