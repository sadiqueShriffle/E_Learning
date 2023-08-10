Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get 'course/index'
      # get 'course/show'
      # get 'course/create'
      # get 'course/update'
      # get 'course/destory'
      # get 'users/show'
      # get 'users/create'
      # get 'users/update'
      # get 'users/delete'

      resources :users, only: [:index  ,:show, :create , :update , :destroy]
      resources :course, only: [:index  ,:show, :create , :update , :destroy]

    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
