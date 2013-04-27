def seed_users
  10.times do
    User.create(username: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password")
  end
end

def seed_decks
  a = Deck.create(name: "Ruby Deck")
  a.cards << Card.create( question: "To create a second name for the variable or method.",
                         answer: "alias")
  a.cards << Card.create( question: "A command that appends two or more objects together.",
                          answer: "and")


  b = Deck.create(name: "Javascript Deck")
  b.cards << Card.create( question: "Designates code that must be run unconditionally at the beginning of the program before any other.",
                          answer: "BEGIN")
  b.cards << Card.create( question: "starts a case statement; this block of code will output a result and end when it's terms are fulfilled, which are defined with when or else.",
                          answer: "break")
end

seed_users
seed_decks


User.create(username: 'test',
      email: 'test@email.com',
      password: "test")
  
