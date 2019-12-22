Rails.application.routes.draw do
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  
  resources :users, only: [:create, :show, :index]
  namespace :api do
    namespace :v1 do
      resources :characters do
        resources :normals, only: [:index, :create, :show, :update, :destroy]
        resources :supers, only: [:index, :create, :show, :update, :destroy] 
        resources :specials, only: [:index, :create, :show, :update, :destroy] do
          resources :variants, only: [:index, :create, :show, :update, :destroy]
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
