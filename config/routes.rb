Rails.application.routes.draw do
  resources :admins

  resources :categories do
    resource :works, only: [:index, :new, :create]
  end
  resources :works, only: [:show, :edit, :update, :destroy]

  match '/front' => 'works#front',
    via: :get,
    as: 'front'


  match '/about' => 'miscs#about',
    via: :get,
    as: 'about'

  root 'admins#authorize', as: 'authorize'
end
