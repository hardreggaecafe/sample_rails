class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :chk_admin

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to @user, flash: { notice: 'ユーザが作成されました' }
    else
      redirect_to new_user_path, flash: { error: 'ユーザの作成に失敗しました' }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, flash: { notice: 'ユーザが変更されました' }
    else
      redirect_to new_user_path, flash: { error: 'ユーザの変更に失敗しました' }
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy!
      redirect_to user_index_path, notice: "削除しました"
    else
      redirect_to user_index_path, alert: "削除に失敗しました"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :role)
  end

  def chk_admin
    redirect_to "/", flash: { alert: '管理者ユーザでないためユーザ管理は利用できません' } if !current_user.is_admin?
  end
end
