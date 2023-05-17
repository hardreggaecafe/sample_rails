class TaskController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Task.my_tasks(current_user).ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
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

  def destroy
    task = Task.find(params[:id])

    if task.destroy!
      redirect_to task_index_path, notice: "削除しました"
    else
      redirect_to task_index_path, alert: "削除に失敗しました"
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :status, :user_id, :duedate, :label)
  end
end
