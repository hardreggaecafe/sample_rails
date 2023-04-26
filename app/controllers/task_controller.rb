class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save!
      redirect_to @task, flash: { notice: 'タスクが作成されました' }
    else
      redirect_to new_task_path, flash: { error: '記事の作成に失敗しました' }
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, flash: { notice: 'タスクが変更されました' }
    else
      redirect_to new_task_path, flash: { error: '記事の変更に失敗しました' }
    end
  end
  private
  def task_params
    params.require(:task).permit(:name, :description, :status, :duedate, :label)
  end
end
