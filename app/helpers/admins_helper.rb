module AdminsHelper
  def sign_in(admin)
    admin.store_new_token
    session[:admin] = admin.username
  end

  def sign_out(username)
    admin = Admin.where(username: username).take
    admin.store_new_token
    session[:admin] = nil
  end
end
