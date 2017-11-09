class WorksController < ApplicationController
  before_action :find_work, only: [:show, :destroy]

  def index
    @works = Work.all
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.new(image_info)

    if work.save
      flash[:success] = 'work uploaded and saved *nice*'
      redirect_to work_path(work.id)
    else
      flash.now[:error] = "invalid input, no upload occured :("
      render 'new'
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path
  end

  def front
    @work = Work.first
    render 'front_page'
  end

  private

  def find_work
    @work = Work.find(params[:id])
  end

  def image_info
    params.require(:work).permit(:title, :image)
  end
end
