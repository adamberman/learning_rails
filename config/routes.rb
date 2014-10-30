MusicInventorySystem::Application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :bands
end
