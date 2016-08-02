class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.save
    redirect_to current_user
  end

  def index
  end

  def destroy
  end



  private

  def task_params
    params.require(:task).permit(:title, :details, :due_date, :points)
  end
end
