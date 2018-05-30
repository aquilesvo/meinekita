Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :kindergardens, only: [:index, :show] do
    resources :inquiries, only: [:new, :create, :destroy, :update, :edit, :show]
    resources :bookmarks
  end
  resources :inquiries, only: [:index]
  resources :users, only: [:show, :update, :destroy]

end
