def seed_users
  10.times do
    User.create(username: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password")
  end
end

def seed_decks
  a = Deck.create(name: "Ruby Deck")
  
  3.times do |x|
    a.cards << Card.create( question: "q" + x.to_s,
                         answer: "a" + x.to_s)
  end
end

seed_users
seed_decks


User.create(username: 'test',
      email: 'test@email.com',
      password: "test")
  
