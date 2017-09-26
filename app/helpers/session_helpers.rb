helpers do
  def logged_in?
    session[:account_id]
  end

  def account
    Account.find(session[:account_id])
  end

  def current_account
    @current_account
  end
end
