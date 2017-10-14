Rails.application.routes.draw do
  resources :service_areas
  resources :categories
  resources :jobs do
    resources :comments
  end
  devise_for :users
  root 'jobs#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
