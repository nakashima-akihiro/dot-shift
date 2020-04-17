Rails.application.routes.draw do
  devise_for :users, module: 'user/auth'
  
  scope module: :user do
    get 'users/:id/logs', to: 'logs#index', as: 'user_logs'
    post 'time_in', to: 'logs#time_in', as: 'time_in'
    post 'time_out', to: 'logs#time_out', as: 'time_out'
    root to: 'users#top'
  end
end
