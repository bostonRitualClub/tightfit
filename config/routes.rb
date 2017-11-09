Rails.application.routes.draw do
  root 'cam_models#index'

  get "/cam_model", to: 'cam_models#cam_model'

  resources :cam_models
end
