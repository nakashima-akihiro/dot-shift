Rails.application.routes.draw do
  devise_for :admins, module: 'admin/auth'
  devise_for :users, module: 'user/auth'

  scope module: :user do
    get 'users/:id/logs/last_month', to: 'logs#last_month_index', as: 'user_logs_last_month'
    patch 'users/:id/logs/:id/edit', to: 'logs#update', as: 'user_log_update'
    get 'users/:id/logs/:id/edit', to: 'logs#edit', as: 'user_log_edit'
    post 'time_out', to: 'logs#time_out', as: 'time_out'
    post 'time_in', to: 'logs#time_in', as: 'time_in'
    get 'users/:id/logs', to: 'logs#index', as: 'user_logs'
    root to: 'users#top'
  end
end
