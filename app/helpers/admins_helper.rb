module AdminsHelper
  def sign_in(admin, stay = true)
    admin.store_new_token
    store_to_cookie(admin) if stay
    session[:admin] = admin.username
  end

  def sign_out(username)
    admin = Admin.where(username: username).take
    admin.store_new_token
    session[:admin] = nil
  end

  def store_to_cookie(admin)
    cookies.permanent[:auth_token] = admin.raw_token
    cookies.permanent.signed[:name] = admin.username
  end
end
