get '/game/create' do
  @game = Game.create(params)
end

post '/game/create' do

end

get '/game/' do

end

get '/game/:id' do
  erb :game_page
end

