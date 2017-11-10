class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @id = params[:id]
    @works = Category.find(params[:id]).works
  end
end
