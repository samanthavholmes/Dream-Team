class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  validates :question, :answer, presence: true


  def self.check_answer?(card, guess)
    card.answer.downcase == guess.downcase
  end
end


