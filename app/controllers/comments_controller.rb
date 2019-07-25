class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(content: params[:comment][:content], user_id: params[:comment][:user_id])
    redirect_to post_path(params[:post_id])
  end

  def update
  
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
