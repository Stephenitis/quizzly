get '/cards' do 
  @cards = Card.all
  erb :cards_index
end


get '/card/new' do
  erb :card_new
end


post '/card/new' do
  @card = Card.create(:question => params[:question], :answer => params[:answer] )
  if @card 
    redirect "/card/#{@card.id}"
  else
    @errors = "Please fill in both Question and Answer fields!"
    erb :card_new
  end
end

get '/card/:id' do 
  @card = Card.find(params[:id])
  erb :card
end
