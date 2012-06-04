require "game"
require "guess"

class EnumerationStrategy
  
  def initialize
    @game = Game.new
  end
  
  def remember guess, score
    @game.remember guess, score
  end
  
  def next_guess
    guess = Guess.new("AAAA")
    while !@game.compatible?(guess) && !guess.last?
      guess = guess.succ
    end
    guess.last? && !@game.compatible?(guess) ? nil : guess
  end
end

