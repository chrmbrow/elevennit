class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :link, :body))
    if @post.save
      redirect_to new_post_path, flash: { notice: 'Post successfully added.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

end
