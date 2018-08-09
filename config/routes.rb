Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about', as: :about
  resources :kindergardens, only: [:index, :show] do
    resources :inquiries, only: [:new, :create, :destroy, :update, :edit, :show]
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  resources :inquiries, only: [:index]
  resources :bookmarks, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy]
  patch '/userphoto/:id', to: 'users#remove_photo', as: 'user_photo'
end
