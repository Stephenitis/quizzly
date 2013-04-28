helpers do

  def authenticate_login  
    case
    when @user && @user.authenticate(params[:username], params[:password])
      session[:id] = @user.id
      redirect to "/user/#{@user.id}"
    else
      @error = 'Invalid email and/or password'
      erb :user_login
    end
  end 

  def clear_session
    session.clear
  end

  def logged_in?
    return true if session[:id]
  end
end