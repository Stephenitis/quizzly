# show all decks
get '/decks' do 
  @decks = Deck.all
  erb :decks_index
end


# show card for this deck id
get '/deck/:id' do 
  @deck = Deck.find(params[:id])
  erb :deck
end
