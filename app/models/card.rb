class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :games, :through => :attempts

  validates :question, :presence => true
  validates :answer, :presence =>true
end
