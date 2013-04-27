get '/game/create' do
  
end

post '/game/create' do
  @game = Game.create(params[:game_deck])
  redirect to "/game/id/#{@game.id}"
end

get '/game/' do

end

get '/game/id/:id' do
  erb :game_page
end

