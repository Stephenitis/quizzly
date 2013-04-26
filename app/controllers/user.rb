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


get '/user/:id' do
  @user = User.find(params[:id])
  erb :user_home
end

