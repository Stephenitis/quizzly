def seed_users
  User.create(username: 'test', email: 'test@email.com', password: "test")
  
  10.times do 
    User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: "password") 
  end

end

def seed_decks
  15.times do
    deck = Deck.create(name: Faker::Company.name)
    20.times { |x| deck.cards << Card.create( question: 'What is ' + Faker::Company.catch_phrase + '?', answer: Faker::Company.bs.capitalize) }
  end
end


def seed_attempts
  10000.times do
    Attempt.create( game_id: rand(1..100), card_id: rand(1..50), status: [true, false][rand(0..1)] )
  end

end


def seed_games
  1000.times do
    Game.create(user_id: rand(1..10), deck_id: rand(1..15), status: [true, false][rand(0..1)])
  end
end




# seed_users
# seed_decks
seed_attempts
seed_games


  
