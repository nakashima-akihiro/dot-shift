Rails.application.routes.draw do
  devise_for :users, module: 'user/auth'
  
  scope module: :user do
    get 'users/logs', to: 'users#log', as: :logs
    root to: 'users#top'
  end
end
