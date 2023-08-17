Rails.application.routes.draw do

  resources :users, only: [:index  ,:show, :create , :update , :destroy]

  resources :users do
    resources :courses ,only: [:show , :index , :create , :update ,:destroy]
  end

  resources :users do
    resources :subscriptions ,only: [:show , :index , :create ]
  end

  # resources :users do
  #   resources :subscriptions, only: [:index, :create, :destroy]
  # end

  # resources :courses do
  #   resources :chapters ,only: [:show , :index , :create , :update ,:destroy]
  # end 
   
  # resources :chapters do
  #   resources :practice_questions ,only: [:show , :index , :create , :update ,:destroy]
  # end



      # resources :courses, only: [:index  ,:show, :create , :update , :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
