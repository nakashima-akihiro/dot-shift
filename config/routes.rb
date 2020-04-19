Rails.application.routes.draw do
  devise_for :users, module: 'user/auth'
  
  scope module: :user do
    patch 'users/:id/logs/:id/edit', to: 'logs#update', as: 'user_logs_update'
    get 'users/:id/logs/:id/edit', to: 'logs#edit', as: 'user_logs_edit'
    post 'time_out', to: 'logs#time_out', as: 'time_out'
    post 'time_in', to: 'logs#time_in', as: 'time_in'
    get 'users/:id/logs', to: 'logs#index', as: 'user_logs'
    root to: 'users#top'
  end
end
