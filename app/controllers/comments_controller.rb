class CommentsController < ApplicationController

  # skip_before_action
  skip_before_action :login_forbided
  
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comments = Comment.all
    @comment.user_id = current_user.id
    if @comment.save
      render :index
    else
      render :error
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
