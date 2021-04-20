Rails.application.routes.draw do
  resources :avatars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "avatars#index"
end
