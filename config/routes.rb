Rails.application.routes.draw do


	resources :tasks do
		resources :task_items do
			member do
				patch :complete
    		end
    	end
    end

    root 'tasks#index'
  
end
