get '/game/create' do
  
end

post '/game/create' do
  @game = Game.create(params[:game_deck])
  session[:cards_in_current_game] = @game.deck.cards.map { |card| card.id } 
  session[:current_game_id] = @game.id
  session[:current_card_position] = 0
  redirect to "/game/play"
end

get '/game/' do

end

get '/game/play' do
  unless session[:cards_in_current_game].length == session[:current_card_position]
    current_card_id = session[:cards_in_current_game][session[:current_card_position]]
    @current_card = Card.find(current_card_id)
    @current_game_id = session[:current_game_id]
    erb :game_page
  else
    "congrats you are done"
  end
end

post '/game/attempt' do
  puts 'below are the params'
  puts params
  Attempt.create(params)
  session[:current_card_position] += 1
  redirect to '/game/play'
end

