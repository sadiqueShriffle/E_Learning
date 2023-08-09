Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get 'users/show'
      # get 'users/create'
      # get 'users/update'
      # get 'users/delete'

      resources :users, only: [:index  ,:show, :create , :update , :delete]

    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
