Rails.application.routes.draw do
  resources :avatars
  root "avatars#index"
end
