Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}
            

  resources :blogs do
    resources :comments, only: [:create, :update, :destroy]
  end  
  
  resources :organization do 
    resources :memberships
  end
  
  resources :profiles, only: [:new, :create, :show, :edit, :update]

  

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
