class PostsController < ApplicationController
  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    @post.categories.build
  end

  def create
    @category = Category.find_or_create_by(params[:post][:categories_attributes][0])
    @category.posts.create(post_params)

    redirect_to post_path(@category.posts.last.id)
  end

  def update
    @post = Post.find(params[:id])
    @post.comments.create(content: params[:post][:comment][:content], user_id: params[:post][:user_ids])
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comments_attributes: [:content, :user_ids, :post_id])
  end
end
