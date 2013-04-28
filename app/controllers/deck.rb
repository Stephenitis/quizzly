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
  @deck = Deck.create(params)
  create_deck
end

get '/deck/:id' do 
  @deck = Deck.find(params[:id])
  erb :deck, :layout => false
end

get '/deck/:id/edit' do 
  @deck = Deck.find(params[:id])
  erb :deck_edit
end

post '/deck/:id/edit' do 
  @deck = Deck.find(params[:id])
  @deck.update_attributes(params)
end
