Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  get '/todays_tasks' => 'tasks#todays_tasks'
  resources :categories do
    resources :tasks
  end
  devise_for :users
end
