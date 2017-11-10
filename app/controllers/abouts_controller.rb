class AboutsController < ApplicationController
  def edit
    @about = About.first
  end

  def update
    @about = About.find(params[:id])
    if @about.update_attributes(about_info)
      flash[:success] = 'information saved'
      redirect_to abouts_path
    else
      flash.now[:error] = 'invalid input'
      render 'edit'
    end
  end

  def index
    @about = About.first
  end

  def about_info
      params.require(:about).permit(:statement, :image, :bio)
  end
end
