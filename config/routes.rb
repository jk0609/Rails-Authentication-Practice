Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome' => 'welcome#index'
  resources :categories do
    resources :products
  end

  resources :products do
    resources :reviews, :only => ['create', 'destroy']
  end
  root :to => 'welcome#index'
end
