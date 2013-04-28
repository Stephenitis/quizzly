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

get '/user/stats' do 
  
  # @attempts_all = Game.find_all_by_user_id(session[:id]).map { |game| game.attempts }.flatten
  @game = Game.find_all_by_user_id(session[:id])
  @attempts_history = {}
  @percentage_data = []
  @game.each do |game|
    total = game.attempts.count
    correct = game.attempts.where(status: true).count
    incorrect = total - correct
    percentage = (correct.to_f / total.to_f) * 100 if correct > 0

    @attempts_history[game.id] = [game.deck.name, total, correct, incorrect, percentage]
    @percentage_data << {game_id: game.id, percentage: percentage}
  end

    
  p @hash
  erb :statistics_home
end



get '/user/stats/:id' do
  @game = Game.find(params[:id])
  @correct = @game.attempts.where(status: true).count
  @incorrect = @game.attempts.where(status: false).count
  @time_series = @game.attempts.map { |attempt| attempt.created_at }
  
  @test =[]
  (@time_series.length-1).times do |x|
    #change variable name
    @test << { attempts: x, time: (@time_series[x+1]-@time_series[x])}
  end
  erb :game_stats
end


get '/user/:id' do
  @user = User.find(session[:id])
  erb :user_home
end


