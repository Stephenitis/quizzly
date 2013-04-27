class Game < ActiveRecord::Base
  belongs_to :user
  has_many :attempts 
  has_many :cards, :through => :attempts
  belongs_to :deck
end
