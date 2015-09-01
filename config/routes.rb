Rails.application.routes.draw do
  

  resources :tasks do
    resources :items
  end
  root 'tasks#index'
  
end
