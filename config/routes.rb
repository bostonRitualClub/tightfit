Rails.application.routes.draw do
  root 'welcome#index'

  get 'live', to: 'cams#index'
end
