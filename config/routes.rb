Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  get 'welcome/index'
  resources :courses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
