Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  authenticate :user do
    resources :selections
    resources :meals
  end


end
