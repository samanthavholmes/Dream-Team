class Deck < ActiveRecord::Base
  has_many :games
  has_many :cards

  validates :deck_name, presence: true
end
