Rails.application.routes.draw do
  root 'home#index'
  get '/todays_tasks' => 'tasks#todays_tasks'
  resources :categories do
    resources :tasks
  end
  devise_for :users
end
