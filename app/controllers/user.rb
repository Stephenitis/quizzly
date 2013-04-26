get '/user/signup' do 

  erb :user_signup
end


get '/user/login' do 

  erb :user_login
end


get '/user/:id' do


  erb :user_home
end

