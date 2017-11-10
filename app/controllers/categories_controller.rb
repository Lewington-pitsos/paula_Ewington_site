class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :show]

  def index
    @categories = Category.all
  end

  def show
    @works = @category.works
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_info)
    if @category.save
      flash[:success] = 'Category created *nice*'
      redirect_to categories_path
    else
      flash.now[:error] = "invalid input, no upload occured :("
      render 'new'
    end
  end

  def edit
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_info
    params.require(:category).permit(:title, :image)
  end
end
