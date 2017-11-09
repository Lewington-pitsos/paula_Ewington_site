class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @works = Category.find(params[:id]).works
  end
end
