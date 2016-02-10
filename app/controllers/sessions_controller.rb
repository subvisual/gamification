class SessionsController < Clearance::SessionsController
  def headquarters
    @user = User.find_or_create_from_headquarters(auth_hash.info)
    sign_in(@user)
    redirect_back_or url_after_create
  end

  def auth_hash
    request.env["omniauth.auth"]
  end
end
