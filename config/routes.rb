Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  resources :issues
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }, path: 'users'
  devise_for :admins, path: 'admins', as: :authenticated_root
  # get 'welcome/index'
  resources :courses
  resources :users

  match 'users/:id' => 'users#edit', :via => :edit, :as => :admin_edit_user
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'courses#index'
  root 'issues#index'
end
