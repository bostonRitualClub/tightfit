Rails.application.routes.draw do
  root 'cams#index'

  resources :cams
  
  get '/show' => 'cams#show'
end
