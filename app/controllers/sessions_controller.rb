class SessionsController < ApplicationController
  def new
  end
  def create
    email = session_params[:email].downcase
    password = session_params[:password]
    if login(email, password)
      flash[:success] = "ログインに成功しました."
      redirect_to @user
    else
      flash.now[:danger] = "ログインに失敗しました."
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました."
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      true
    else
      false
    end
  end
end
