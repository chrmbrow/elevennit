class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render :index
  end

  def show
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_path, flash: { notice: 'Post successfully added.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, flash: { notice: 'Post successfully updated.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :body, :post_type)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
