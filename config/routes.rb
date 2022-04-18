Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: [:destroy]
end
