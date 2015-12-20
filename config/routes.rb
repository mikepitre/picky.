Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  # authenticate :user do
    resources :selections, only: [:show, :new, :create]
    # resources :meals
  # end

get "*path", to: redirect('/')
end
