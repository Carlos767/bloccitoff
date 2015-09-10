class Task < ActiveRecord::Base
	has_many :task_items
	belongs_to :user


	validates :title, presence: true, length: { minimum: 3 }
	validates :description, presence: true,length: { minimum: 5 }

	def has_completed_items?
		task_items.complete.size > 0
	end

	def has_incomplete_items?
		task_items.incomplete.size > 0
	end
end

# view
# <%= link_to "Complete", user_task_complete_path(current_user, task), method: :put %>
# <%= task.completed ? "Completed" : "Pending" %>
# Expires in: <%= distance_of_time_in_words_to_now(task.expires_at) %>

# routes
# resources :tasks do
#	put :complete
# end

# tasks controller
# def complete
#    @task = Task.find(params[:task_id])
	#if task is complete, then make complete false, else make it true. then, redirect_to somewhere
# end

# task
# expires_at:datetime
# completed:boolean
# git rm --cached config/application.yml