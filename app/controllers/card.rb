get '/cards' do 
  @cards = Card.all
  erb :cards_index
end


get '/card/:deck_id/new' do
  @deck = Deck.find(params[:deck_id])
  erb :card_new
end


post '/card/new' do
  @card = Card.create(params)
  if @card 
    redirect "/deck/#{@card.deck_id}"
  else
    @errors = "Please fill in both Question and Answer fields!"
    erb :card_new
  end
end

get '/card/:id' do 
  @card = Card.find(params[:id])

  erb :card
end
