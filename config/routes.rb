Rails.application.routes.draw do

  devise_for :customers, :controllers => { registrations: 'customers/registrations', :passwords => "customers/passwords" }

  resources :customers, only: [:show, :edit, :update]

  resources :conversations, only: [:index]

  resources :customers, only: [:show, :edit, :update] do
    resources :conversations, only: [:index]
    resources :messages, only: [:index, :create, :destroy]
    resources :preferences, only: [:edit, :update]
  end

  resources :profiles, only: [:index]

  root 'pages#home'

  get '/success-stories' => 'pages#success_stories'
  get '/password-email-sent' => 'pages#password_email_sent'
  get '/confirmation-email-sent' => 'pages#confirmation_email_sent'

end
