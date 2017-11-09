class WorksController < ApplicationController
  def index

  end

  def show
    @work = Work.find(params['id'])
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

  private

  def image_info
    params.require(:work).permit(:title, :image)
  end
end
