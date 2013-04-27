helpers do
  def user_loggedin?
    (session[:id])  if session[:id]

  end
end