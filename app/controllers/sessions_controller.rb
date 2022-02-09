class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user, notice: "ログインしました!"
    else
      flash[:danger] = "メールアドレス、パスワードが間違っています。"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = "ログアウトしました!"
    redirect_to new_session_path
  end
end
