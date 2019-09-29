class UsersController < ApplicationController

  before_action :user_params, only: [:create]
  before_action :set_users, only: [:show, :edit, :update, :feed]
  before_action :set_favorite, only: [:feed]

  # skip_before_action
  #skip_before_action :login_required
  #skip_before_action :login_forbided, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "アカウントを作成しました"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def feed
    @favorites = current_user.favorite_pictures
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :user_name, :password, :password_confirmation, :image, :image_cache)
    #params.require(:user).permit(:email, :full_name, :user_name, :password, :password_confirmation, :image, :birthday, :gender)
  end

  def set_favorite
    @favorite_count = Favorite.where(user_id: @user.id).count
  end

end
