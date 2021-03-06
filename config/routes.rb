Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks, except: :index
  put 'tasks/:id/complete', to: 'tasks#complete'
end
