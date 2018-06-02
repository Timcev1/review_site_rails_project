Rails.application.routes.draw do
  resources :service_areas
  resources :categories
  resources :jobs do
    resources :comments
  end
  root 'jobs#index', as: 'home'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get '/user/sign_out', to: redirect('/jobs') 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
