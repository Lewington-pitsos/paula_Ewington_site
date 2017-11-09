Rails.application.routes.draw do
  resources :works, :admins

  root 'works#front', as: 'front'
end
