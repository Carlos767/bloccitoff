class TaskItemsController < ApplicationController
  def index
  	@task = TodoList.find(params[:task_id])
  end

  def new
  	@task = TodoList.find(params[:task_id])
  	@task_item = @task.task_items.new
  end

  def create
  	@task = TodoList.find(params[:task_id])
  	@task_item = @task.task_items.new(task_item_params)
  	if @task_item.save
  		flash[:success = "Added task item."]
  		redirect_to task_task_items_path
  	else
  		flash[:error] = "There was a problem adding that task list item."
  		render action: :new
  	end
  end

  def edit
    @task = TodoList.find(params[:task_id])
    @task_item = @task.task_items.find(params[:task_id])
  end

  def update
    @task = TodoList.find(params[:task_id])
    @task_item = @task.task_items.find(params[:task_id])
    if @task_item.update_attributes(task_items_params)
      flash[:success = "Saved todo task item."]
      redirect_to task_task_items_path
    else
      flash[:error] = "That todo item could not be saved."
      render action: :edit
    end
  end

  def url_options
    { task_id: params[:task_id] }.merge(super)
  end


  private
  def task_item_params
  	params[:task].permit(:content)
  end



end
