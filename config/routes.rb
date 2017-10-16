Rails.application.routes.draw do
  root 'cams#index'

  get 'live', to: 'cams#index'
end
