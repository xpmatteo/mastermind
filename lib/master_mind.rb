require "enumeration_strategy"

class MasterMind
  def initialize
    @strategy = EnumerationStrategy.new
    @guess = @strategy.next_guess
  end
  
  def guess
    @guess
  end
  
  def respond_with score
    @score = Score.from_string(score)
    @strategy.remember(@guess, @score)
    @guess = @strategy.next_guess
  end
  
  def victory?
    @score && @score.victory?
  end
end

