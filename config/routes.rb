Rails.application.routes.draw do
  root 'cam_models#index'

  get "/cam_model", to: 'cam_models#cam_model'

  get "/cam_model/refresh", to: 'cam_models#cam_model_refresh'

  resources :cam_models
end
