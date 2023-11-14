class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET
  def index
    @tasks = Task.all
  end

  def show
  end

  # CREATE
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_param)
    @task.save
    redirect_to tasks_path
  end

  # UPDATE
  def edit
  end

  def update
    @task.update(task_param)
    redirect_to tasks_path
  end

  # DELETE
  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_param
    params.require(:task).permit(:title, :details, :completed)
  end
end
