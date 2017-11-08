Rails.application.routes.draw do
  root 'cams#index'

  get "/cam_model", to: 'cams#cam_model', as: :show_model_path

  resources :cams
end
