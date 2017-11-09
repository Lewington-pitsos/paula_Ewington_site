class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_credentials)

    if @admin.authenticated?
      flash[:success] = 'logged in as admin'
      sign_in(@admin)
      redirect_to works_path
    else
      flash.now[:error] = 'incorrect login credentials'
      render 'new'
    end
  end

  def destroy
    sign_out
    session[:success] = 'logged out, viewing site as a regular user'
    redirect_to works_path
  end

  private

  def admin_credentials
    params.require(:admin).permit(:username, :password)
  end
end
