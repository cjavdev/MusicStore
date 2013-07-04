MusicApp::Application.routes.draw do
  root :to => "sessions#new"
  resource :session

  resources :notes

  resources :users do
    member do
      get "activate"
    end
  end

  resources :bands
  resources :albums
  resources :tracks
  resources :artists
end
