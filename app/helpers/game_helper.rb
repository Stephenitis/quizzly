helpers do
  def list_all_decks 
    Deck.all
  end

  def quit_game
    session[:current_card_position] = session[:cards_in_current_game].length
  end
end
