class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_credentials)

    if @admin.authenticated?
      flash[:success] = 'logged in as admin'
      redirect_to works_path
    else
      flash.now[:error] = 'incorrect login credentials'
      render 'new'
    end
  end

  def destroy

  end

  private

  def admin_credentials
    params.require(:admin).permit(:username, :password)
  end
end
