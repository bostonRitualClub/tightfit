Rails.application.routes.draw do
  root 'cam_models#index'

  get "/cams", to:'cam_models#index'
  get "/cam_model", to: 'cam_models#index'
  get "cam_model/:id", to: 'cam_models#show'

  get "/cam_models/refresh", to: 'cam_models#cam_model_refresh'

  resources :cam_models
end
