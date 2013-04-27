get '/user/signup' do 
  erb :user_signup
end

post '/user/signup' do 
  @user = User.create(params)
  session[:id] = @user.id
  redirect "/user/#{@user.id}"
end

get '/user/login' do 
  erb :user_login
end

post '/user/login' do
  @user = User.find_by_username(params[:username])
  if @user && @user.authenticate(params[:username], params[:password])
    session[:id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @error = "Invalid email and password"
    erb :user_login
  end
end

# Needs to be before User Session
get '/user/logout' do 
  session.clear
  redirect '/'
end

get '/user/:id' do
  @user = User.find(session[:id])
  erb :user_home
end


