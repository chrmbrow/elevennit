class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.with_categories.page(params[:page])
    # scopes can be chained as well
    # @posts = Post.with_categories.added_today
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

  def destroy
    if @post.destroy
      redirect_to posts_path, flash: { notice: 'Your post has been removed.' }
    else
      redirect_to posts_path, flash: { notice: 'We were unable to remove that post.' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :body, :post_type, :category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
