class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :completed]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task was successfully deleted.'
  end

  def back
    redirect_to tasks_path
  end

  def completed
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
