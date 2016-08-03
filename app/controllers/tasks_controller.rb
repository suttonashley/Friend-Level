class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge({user_id: current_user.id}))
    @task.save
    redirect_to current_user
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to current_user
  end

  def index
  end

  def destroy
    @task.destroy
    redirect_to current_user
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:doer_id, :creator_id, :title, :details, :due_date, :points)
  end

end
