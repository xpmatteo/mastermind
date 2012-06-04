class Game
  def initialize
    @history = []
  end
  
  def remember guess, score
    guess = Guess.new(guess) if guess.is_a? String
    score = Score.from_string(score) if score.is_a? String
    @history << [guess, score]
  end
  
  def compatible? guess
    @history.each do |old_guess, old_score|
      return false if old_score != Score.compare(guess, old_guess)
    end
    true
  end
end


