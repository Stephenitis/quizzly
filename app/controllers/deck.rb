# show all decks
get '/decks' do 
  @decks = Deck.all
  erb :decks_index
end

get '/deck/new' do
  @user = User.find(session[:id])
  erb :deck_new
end


post '/deck/new' do
  puts "your params are"
  p params
  @deck = Deck.create(params)
  p @deck
  if @deck 
    redirect "/deck/#{@deck.id}"
  else
    @errors = "you need to name your deck"
    erb :deck_new
  end
end

get '/deck/:id' do 
  @deck = Deck.find(params[:id])
  erb :deck
end

get '/deck/:id/edit' do 
  @deck = Deck.find(params[:id])
  erb :deck_edit
end

post '/deck/:id/edit' do 
  @deck = Deck.find(params[:id])
  @deck.update_attributes(params)
end
