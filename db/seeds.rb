# def seed_users
#   10.times do
#     User.create(username: Faker::Name.name,
#       email: Faker::Internet.email,
#       password: "password")
#   end
# end

def seed_decks
  15.times do
    deck = Deck.create(name: Faker::Company.name)
  
    20.times do |x|
      deck.cards << Card.create( question: 'What is ' + Faker::Company.catch_phrase + '?',
                              answer: Faker::Company.bs.capitalize)
    end

  end
end

User.create(username: 'test',
      email: 'test@email.com',
      password: "test")

seed_decks



  
