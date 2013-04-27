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
  @deck_of_cards = @game.deck.cards


  
  # if @game.attempts.last
  #   @last_card_id = @game.attempts.last.card_id 
  #   @deck_of_cards_index = @deck_of_cards.find_index { |card| card.id == @last_card_id } + 1
  # else 
  #   @deck_of_cards_index = 0
  # end
  erb :game_page
end

post '/game/attempt' do
  att = Attempt.create(params[:game_play])
  redirect to '/game/id/2'
end

