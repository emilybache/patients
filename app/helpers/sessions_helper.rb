module SessionsHelper
  def sign_in(user)
    cookies[:remember_token] = user.id
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  private

  def user_from_remember_token
    User.find_by_id remember_token
  end

  def remember_token
    cookies[:remember_token] || nil
  end
end
