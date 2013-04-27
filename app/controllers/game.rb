get '/game/create' do
  
end

post '/game/create' do
  @game = Game.create(params[:game_deck])
  redirect to "/game/id/#{@game.id}"
end

get '/game/' do

end

get '/game/id/:id' do
  @game_id = params[:id]
  @game = Game.find(@game_id)
  @last_card_id = @game.attempts.last.card.id
  @deck_of_cards = @game.deck.cards
  erb :game_page
end

post '/game/attempt' do
  att = Attempt.create(params[:game_play])
  p att
  redirect to '/game/id/2'
end

