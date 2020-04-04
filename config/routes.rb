Rails.application.routes.draw do
  get 'locations/show'
  root 'chapters#index'
  get 'search/show'
  get 'chapters/index'
  get 'chapters/:id' => 'chapters#show'
  get 'characters/:id' => 'characters#show'
  get 'locations/:id' => 'locations#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
