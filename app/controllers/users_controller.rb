class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :set_user, only: %i[show favorites edit update destroy]
  before_action :ensure_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # ContactMailer.contact_mail(@user).deliver
      redirect_to @user, notice: "アカウント作成しました!"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def favorites
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー情報を編集しました!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = "退会しました!"
    redirect_to new_user_path
  end
  private
  def user_params
    params.require(:user).permit(:name, :email,
      :password, :password_confirmation, :image, :image_cache)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def ensure_user
    if @user.id != current_user.id
      flash[:danger] = "編集権限がありません!"
      redirect_back(fallback_location: @user)
    end
  end
end
