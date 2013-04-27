class Deck < ActiveRecord::Base
  validates :name, :presence =>true
  belongs_to :user
  has_many :cards
  has_many :games
end
