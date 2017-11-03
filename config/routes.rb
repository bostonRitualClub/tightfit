Rails.application.routes.draw do
  root 'cams#index'

  resources :cams

  get "models/:id", to: 'cams#show_cam_model', as: :model_path

end
