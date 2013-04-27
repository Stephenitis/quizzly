get '/cards' do 
  @cards = Card.all
  erb :cards_index
end

get '/card/:id' do 
  @card = Card.find(params[:id])
  erb :card
end
