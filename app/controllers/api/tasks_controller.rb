class Api::TasksController < ApplicationController
  before_action :authorize_request

  def index
    tasks = @current_user.tasks
    render json: tasks
  end

  def create
    task = @current_user.tasks.build(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { error: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    task = @current_user.tasks.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: { error: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    task = @current_user.tasks.find(params[:id])
    task.destroy
    head :no_content
  end

  private

  
  def task_params
    params.require(:task).permit(:title, :completed, :priority, :due_date)
  end
end
