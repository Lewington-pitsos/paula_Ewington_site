class WorksController < ApplicationController
  before_action :find_work, only: [:show, :destroy, :edit, :update]

  def index
    @works = Work.all
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
    @work = Work.new
  end

  def create
    category = Category.find(params[:category_id])
    work = category.works.create(image_info)
    if work
      flash[:success] = 'work uploaded and saved *nice*'
      redirect_to work_path(work.id)
    else
      flash.now[:error] = "invalid input, no upload occured :("
      render 'new'
    end
  end

  def destroy
    @work.destroy
    redirect_to categories_path
  end

  def edit
  end

  def update
    if @work.update_attributes(image_info)
      flash[:success] = 'work updated'
      redirect_to categories_path
    else
      flash.now[:error] = 'invalid input'
      render 'edit'
    end
  end

  # ----------------------------------

  def front
    @work = Work.first
    render 'front_page'
  end

  private

  def find_work
    @work = Work.find(params[:id])
  end

  def image_info
    params.require(:work).permit(:title, :image, :caption)
  end
end
