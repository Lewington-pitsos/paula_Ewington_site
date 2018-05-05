Rails.application.routes.draw do
  resources :admins, :abouts

  resources :categories do
    resource :works, only: [:index, :new, :create]
  end

  resources :works, only: [:show, :edit, :update, :destroy]

  root 'categories#index'

  root 'admins#authorize', as: 'authorize'
end
