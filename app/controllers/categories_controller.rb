class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_path, flash: { notice: 'Category successfully added.' }
    else
      flash.now[:error] = @category.errors.full_messages
      render :new
    end
  end

  def show
    @category = Category.includes(:posts).find(params[:id])
    @posts = @category.posts.page(params[:page])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :title, :description, :sidebar, :submission_text)
  end

end
