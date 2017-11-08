Rails.application.routes.draw do
  root 'cams#index'

  get "/cam_model", to: 'cams#cam_model'

  resources :cams
end
