get '/user/stats/' do 
  
  @attempts_all = Game.find_all_by_user_id(session[:id]).map { |game| game.attempts }.flatten
  # @game = Game.find_all_by_user_id(session[:id])
  hash = {}
  @game.each do |g|
    total = g.attempts.count
    correct = a.attempts.count { |attempt| attempt.status == true }
    incorrect = total - correct
    hash[g.deck.name] = [total, correct, incorrect,"See Stats"]
  end
  erb :statistics_home
end

get '/test/stats' do
  @game = Game.find(session[:current_game_id])
  @correct = @game.attempts.where(status: true).count
  @incorrect = @game.attempts.where(status: false).count
  @time_series = @game.attempts.map { |attempt| attempt.created_at }
  
  @test =[]
  (@time_series.length-1).times do |x|
    p x
    @test << { attempts: x, time: (@time_series[x+1]-@time_series[x])}
  end
  erb :game_stats
end