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
    @category = Category.find(params[:category_id])
    @work = @category.works.create(image_info)
    if @work
      flash[:success] = 'work uploaded and saved *nice*'
      redirect_to category_path(params[:category_id])
    else
      flash.now[:error] = "invalid input, no upload occured :("
      render 'new'
    end
  end

  def destroy
    id = @work.category.id
    @work.destroy
    redirect_to category_path(id)
  end

  def edit
  end

  def update
    if @work.update_attributes(image_info)
      flash[:success] = 'work updated'
      redirect_to category_path(@work.category_id)
    else
      flash.now[:error] = 'invalid input'
      render 'edit'
    end
  end

  # ----------------------------------

  private

  def find_work
    @work = Work.find(params[:id])
  end

  def image_info
    params.require(:work).permit(:title, :image, :caption, :place)
  end
end
