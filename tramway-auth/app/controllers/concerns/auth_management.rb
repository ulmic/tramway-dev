module AuthManagement
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user
  end

  def authenticate_user!
    redirect_to new_session_path unless signed_in?
  end

  def authenticate_admin!
    if signed_in?
      redirect_to ::Tramway::Auth.root_path if !current_user.admin? && request.env['PATH_INFO'] != ::Tramway::Auth.root_path
    else
      redirect_to '/auth/session/new'
    end
  end

  def current_user
    @_current_user ||= ::Tramway::User::User.find_by id: session[:user_id]
  end
end
