get '/user/signup' do 
  erb :user_signup
end

post '/user/signup' do 
  @user = User.create(params)
  session[:id] = @user.id
  redirect to "/user/#{@user.id}"
end

get '/user/login' do 
  erb :user_login
end

post '/user/login' do
  @user = User.find_by_username(params[:username])
  authenticate_login
end

get '/user/logout' do 
  clear_session
  redirect '/'
end

get '/stats/home' do 
  
  # @attempts_all = Game.find_all_by_user_id(session[:id]).map { |game| game.attempts }.flatten
  @game = Game.find_all_by_user_id(session[:id])
  @attempts_history = {}
  @game.each do |g|
    total = g.attempts.count
    correct = g.attempts.select { |attempt| attempt.status == true }.length
    g.attempts.each { |attempt| p attempt.status }
    incorrect = total - correct
    @attempts_history[g.id] = [g.deck.name,total, correct, incorrect]
  end
  p @hash
  erb :statistics_home
end



get '/user/:id' do
  @user = User.find(session[:id])
  erb :user_home
end


