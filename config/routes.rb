Rails.application.routes.draw do
  resources :works, :admins

  match '/front' => 'works#front',
    via: :get,
    as: 'front'

  root 'admins#authorize', as: 'authorize'
end
