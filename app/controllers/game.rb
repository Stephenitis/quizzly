get '/game/create' do
  
end

post '/game/create' do
  @game = Game.create(params[:game_deck])
  redirect to "/game/id/#{@game.id}"
end

get '/game/' do

end

get '/game/id/:id' do
  @game = Game.find(params[:id])
  @deck_of_cards = @game.deck.cards
  erb :game_page
end

