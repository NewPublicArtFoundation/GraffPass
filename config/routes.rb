Rails.application.routes.draw do

  # Authorization
  resources :accesskeys
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  #

  get 'api/instagram'
  get 'integration/instagram'
  get 'integration/flickr'
  get 'find'  => 'instagram_arts#indexlocation'
  get 'status/rate' => 'graphs#rate_of_new'

  # Static Pages
  get 'thanks' =>           'pages#thankyou'
  get 'explain' =>          'pages#explain'
  get 'about' =>            'pages#about'
  get 'privacy' =>          'pages#privacy'
  get 'about.html' =>       'pages#about'
  get 'privacy.html' =>     'pages#privacy'

  # Instagram Connect
  get   'api/instagram/oauth/connect' =>      'instagram_poll#oauth_connect'
  get   'api/instagram/callback' =>           'instagram_poll#oauth_callback'
  match 'api/instagram/callback/realtime' =>  'instagram_poll#realtime_response', via: :post
  get   'api/instagram/callback/realtime' =>  'instagram_poll#realtime_callback'

  # concern :paginatable do
  #   get '(page/:page)', :action => :index, :on => :collection, :as => ''
  # end
  # resources :instagram_arts, :concerns => :paginatable

  # Web Views
  get 'p/:id' => 'instagram_arts#show'

  # iOS Views
  resources :instagram_arts, only: [:show]
  get 'slide' => 'instagram_arts#iosview'
  get 'instagram_arts/:id/image' => 'instagram_arts#image'
  root 'pages#home_web'

  get "*any", via: :all, to: "errors#not_found" #404
end
