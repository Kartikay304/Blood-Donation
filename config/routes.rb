Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "blooddonation#index", to:redirect("/#home")
  get "/plasma", to: redirect("/#home-plasma-section")
  get "/why_give_blood", to: redirect("/#home-why_give_blood-section")
  get "/who_can_give_blood", to: redirect("/#home-who_can_give_blood-section")
  get "/donation_process", to: redirect("/#home-donation_process-section")
  get "/about", to: redirect("/#home-about-section")
  
  #signup
  get "/signup", to: "users#signup"
  post "/signup", to: "users#signup"
  resources :users, except: [:signup]

  #signin
  get 'login', to: 'sessions#signin'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #dashboard
  get "/dashboard/:id", to: "dashboard#index"
  post "/dashboard/:id", to: "dashboard#create"
  resources :dashboard, except: [:dashboard]

  #posts
  post "/", to: "blooddonation#create"
end
