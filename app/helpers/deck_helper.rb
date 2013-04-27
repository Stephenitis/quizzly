helpers do
  
  def create_deck
    if @deck 
      redirect to "/deck/#{@deck.id}"
    else
      @errors = 'Invalid deck name'
      erb :deck_new
    end
  end

end