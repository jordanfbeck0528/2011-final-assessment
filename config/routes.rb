Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:index] do
    resources :sugeries 
  end
  resources :surgeries, only: [:show]
end
