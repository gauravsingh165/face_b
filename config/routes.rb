Rails.application.routes.draw do
 namespace :api do
    namespace :v1 do
      resources :users
      resources :posts
      resource :like, only: [:create, :destroy]
    end
  end
end
