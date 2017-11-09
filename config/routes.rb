Rails.application.routes.draw do
  resources :works, :admins, :categories

  match '/front' => 'works#front',
    via: :get,
    as: 'front'


  match '/about' => 'miscs#about',
    via: :get,
    as: 'about'

  root 'admins#authorize', as: 'authorize'
end
