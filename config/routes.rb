Rails.application.routes.draw do

  root  'events#toppage.html'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sesssions: 'users/sessions'
  }
  resources :users, only: [:show]
  resource :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end
  resources :events do
    resources :comments
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
