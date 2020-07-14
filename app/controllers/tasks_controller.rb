class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @tasks = Task.order(deadline: :asc, priority: :asc)
    @completed_tasks = Task.order(updated_at: :desc)
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      @task.save!
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :priority, :done, :gif_id)
  end
end
