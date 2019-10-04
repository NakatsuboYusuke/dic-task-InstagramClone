class PicturesController < ApplicationController

  before_action :set_pictures, only: [:show, :edit, :update, :destroy]
  before_action :set_favorite, only: [:show]
  before_action :current_user?, only: [:edit]

  # skip_before_action
  skip_before_action :login_forbided

  def index
    @pictures = Picture.all.order(created_at: :desc)
    @comments = Comment.all
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
    # get all comments
    @comments = @picture.comments
    # get this comment
    @comment = @picture.comments.build # include @picture.id => @comment.picture_id
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        ConfirmMailer.creation_email(@picture).deliver_now #.deliver_later(wait: 5.minutes)
        flash[:notice] = "投稿が完了しました"
        redirect_to pictures_path
      else
        render :new
      end
    end
  end

  def update
    if @picture.update(picture_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to pictures_path
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to pictures_path
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  private

  def set_pictures
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_favorite
    @favorite_count = Favorite.where(picture_id: @picture.id).count
  end

  def current_user?
    @picture = Picture.find(params[:id])
    redirect_to picture_path(@picture.id) unless @picture.user_id == current_user.id
  end

  # instance method for association
  def user
    return User.find_by(id: @picture.user_id)
  end

end
