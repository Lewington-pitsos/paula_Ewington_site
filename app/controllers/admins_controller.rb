class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_credentials)

    if @admin.authenticated?
      flash[:success] = 'logged in as admin'
      sign_in(@admin, @admin.stay_signed_in != '0')
      redirect_to works_path
    else
      flash.now[:error] = 'incorrect login credentials'
      render 'new'
    end
  end

  def destroy
    sign_out(params[:id])
    flash[:success] = 'logged out, viewing site as a regular user'
    redirect_to works_path
  end

  def authorize
    admin = Admin.where(username: cookies.signed[:name]).take
    if admin && admin.tokens_match(cookies[:auth_token])
      sign_in(admin)
    end
    redirect_to front_path
  end

  private

  def admin_credentials
    params.require(:admin).permit(:username, :password, :stay_signed_in)
  end
end
