class TaskItemsController < ApplicationController
  before action :find_task
  
  def index
    @task =TodoList.find(params[:task_id])
  end

  def new
    @task =TodoList.find(params[:task_id])
  	@task_item = @task.task_items.new
  end

  def create
  	@task = TodoList.find(params[:task_id])
    @task_item = @task.task_items.new(task_item_params)
  	if @task_item.save
  		flash[:success] = "Added task item."
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
      flash[:success] = "Saved todo task item."
      redirect_to task_task_items_path
    else
      flash[:error] = "That todo item could not be saved."
      render action: :edit
    end
  end

  def destroy
    @task_item = @task.task_items.find(params[:id])
    if @task_item.udestroy
      flash[:success] = "Todo Task was deleted."
    else
      flash[:error] = "That todo task could not be deleted."
    end
    redirect_to task_task_items_path
  end
  
  def complete
    @task_item = @task.task_items.find(params[:id])
    @task_item.update_attribute(:completed_at, Time.now)
    redirect_to task_task_items_path, notice: "Todo item marked as complete."
  end


  def url_options
    { task_id: params[:task_id] }.merge(super)
  end


  private

  def find_task
    @task =TaskList.find(params[:task_id])
  end

  def task_item_params
  	params[:task_item].permit(:content)

  end
end
