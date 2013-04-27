class Game < ActiveRecord::Base
  belongs_to :user
  has_many :attempts 
  belongs_to :deck
end
