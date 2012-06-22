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
    @game.compatible?(guess) ? guess : nil
  end
end

