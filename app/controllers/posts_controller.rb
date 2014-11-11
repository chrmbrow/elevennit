class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :link, :body, :post_type))
    if @post.save
      redirect_to new_post_path, flash: { notice: 'Post successfully added.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

end
