class Deck < ActiveRecord::Base
  validates :name, :presence =>true
  has_many :cards
  belongs_to :game
  belongs_to :user
end
