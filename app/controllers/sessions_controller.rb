class SessionsController < ApplicationController

  # skip_before_action
  skip_before_action :login_required
  skip_before_action :login_forbided

  def new
  end

  #login
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id # => create session
      flash[:notice] = "ログインしました"
      redirect_to pictures_path(@user_id)
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render :new
    end
  end

  # logout
  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end

end
