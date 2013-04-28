get 'user/stats/:id' do 
  
  @attempts_all = Game.find_all_by_user_id(session[:id]).map { |game| game.attempts }.flatten
  # @game = Game.find_all_by_user_id(session[:id])
  hash = {}
  @game.each do |g|
    total = g.attempts.count
    correct = a.attempts.count { |attempt| attempt.status == true }
    incorrect = total - correct
    hash[g.deck.name] = [total, correct, incorrect]
  end
  erb :statistics_home
end

