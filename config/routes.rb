Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show] do
    resources :messages, :only => [:new, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
