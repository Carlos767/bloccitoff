class TaskItemsController < ApplicationController
  def index
  	@task = TodoList.find(params[:task_id])
  end
end
