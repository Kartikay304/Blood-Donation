Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "blooddonation#index"
  get "/plasama", to: "blooddonation#plasama"
  get "/why_give_blood", to: "blooddonation#why_give_blood"
  get "/who_can_give_blood", to: "blooddonation#who_can_give_blood"
  get "/donation_process", to: "blooddonation#donation_process"
  get "/about", to: "blooddonation#about"
  
  #signup
  get "/signup", to: "users#signup"
  resources :users, except: [:signup]

  #signin
  get 'login', to: 'sessions#signin'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
