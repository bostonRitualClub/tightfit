Rails.application.routes.draw do
  root 'cams#index'

  resources :cams
end
