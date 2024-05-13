Rails.application.routes.draw do
  devise_for :accounts, controllers: { registration: "accounts/registrations", session: "accounts/sessions"}
  resources :specialists
  resources :software_products
  resources :poly_notes
  resources :problems
  resources :equipment
  resources :operators
  resources :users
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "problems#index"

  # Problem routes
  post "/problems/:id/resolve" => "problems#resolve_problem", as: :resolve_problem
  post "/problems/:id/assign_specialist" => "problems#assign_specialist", as: :assign_specialist
  get "/problems/:id/assigned_specialist" => "problems#assigned_specialist", as: :assigned_specialist

  # Equipment routes
  post "/equipment/:id/equipment_software_product" => "equipment#equipment_software_product", as: :equipment_software_product
  get "/equipment/:id/new_equipment_software_product" => "equipment#new_equipment_software_product", as: :new_equipment_software_product
end
