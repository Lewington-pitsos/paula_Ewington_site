class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.order(:position)
  end

  def show
    @works = @category.works.order(:position)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_info)
    if @category.save
      save_cat_place(@category, @category.place.to_i)
      flash[:success] = 'Category created *nice*'
      redirect_to categories_path
    else
      flash.now[:error] = "invalid input, no upload occured :("
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_info)
      save_cat_place(@category, @category.place.to_i)
      flash[:success] = 'category successfully updated'
      redirect_to categories_path
    else
      flash.now[:error] = 'that input was invalid'
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'category deleted'
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_info
    params.require(:category).permit(:title, :image, :place)
  end
end
