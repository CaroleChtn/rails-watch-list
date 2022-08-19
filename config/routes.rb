Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :movies
  resources :lists do
    resources :bookmarks, only: [:new, :create]
    # on peut nester bookmark car il belongs-to lists + on a besoin d'aller chercher son id pour NEW er CREATE,
    # mais pas pour destroy car l'id a deja été créé
  end
  resources :bookmarks, only: [:destroy]
end
