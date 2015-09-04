Rails.application.routes.draw do


  devise_for :users
	resources :tasks do
		resources :task_items do
			member do
				patch :complete
    		end
    		put :incomplete
    	end
    end

    root 'tasks#index'
  
end
