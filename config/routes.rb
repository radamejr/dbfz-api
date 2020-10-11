Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login' => 'user_token#create'
      
      resources :users, only: [:index, :show, :create, :update, :find]
      resources :characters do
        resources :assists, only: [:index, :create, :show, :update, :destroy]
        resources :normals, only: [:index, :create, :show, :update, :destroy]
        resources :supers, only: [:index, :create, :show, :update, :destroy] do
          resources :super_variants, only: [:index, :create, :show, :update, :destroy]
        end
        resources :specials, only: [:index, :create, :show, :update, :destroy] do
          resources :special_variants, only: [:index, :create, :show, :update, :destroy]
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
