class User < ActiveRecord::Base
  has_many :played_games, class_name: "Game"
  has_many :played_decks, through: :played_games, source: :deck
  has_many :guesses, through: :played_games

  validates :username, presence: true, length: {maximum: 20}, uniqueness: true

  has_secure_password
end
