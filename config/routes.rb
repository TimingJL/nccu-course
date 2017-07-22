Rails.application.routes.draw do
  resources :issues
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  # get 'welcome/index'
  resources :courses
  resources :users

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'courses#index'
end
