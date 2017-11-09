module AdminsHelper
  def sign_in(admin)
    session[:admin] = admin.username
  end

  def sign_out
    session[:admin] = nil
  end
end
