Rails.application.routes.draw do
  resources :works, :admins

  root 'works#index'
end
