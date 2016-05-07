class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :game

  def self.update_guess(guess)
    guess.update_attributes(correct: true)
  end

  def self.display_result(card, guess)
     if guess.correct
        "Correct!"
     else
        "Incorrect. #{card.answer} is the correct answer."
     end
   end
end
