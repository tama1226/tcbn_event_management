Rails.application.routes.draw do

  root  'events#toppage.html'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resource :contacts, only: [:new, :create]
  
  resources :events do
    resources :comments
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
