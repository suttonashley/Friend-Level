class TasksController < ApplicationController
  before_action :set_task, only: [:update]
  before_action :set_task_with_user, only: [:edit]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge({user_id: current_user.id}))
    p @task.errors.details[:title]
    if @task.save
      redirect_to current_user
    else
      flash[:error] = "Cannot be in the past. Try again, friend."
      redirect_to :back
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to current_user
  end

  def index
    @task = Task.where(status: "accepted")
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to current_user
  end

  def request_task
    @task = Task.find(params[:task_id])
    @task.request(User.find(params[:doer_id]))
    redirect_to current_user
  end

  def accept_task
    @task = Task.find(params[:task_id])
    @task.accept(current_user)
    redirect_to current_user
  end

  def decline_task
    @task = Task.find(params[:task_id])
    @task.accept(current_user)
    redirect_to current_user
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def set_task_with_user
    @task = Task.find_by(user_id: params[:user_id], id: params[:id])
  end

  def task_params
    params.require(:task).permit(:doer_id, :creator_id, :title, :details, :due_date, :points)
  end

end
