Rails.application.routes.draw do
  root  'events#toppage.html'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resource :contacts, only: [:new, :create]
  
  resources :events

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
