require "score"

class Guess
  BASE=6
  LENGTH=4
  
  def initialize(letters)
    @value = letters.tr("A-F", "0-5").to_i(BASE)
  end
  
  def succ
    Guess.new(Guess.to_letters(@value+1))
  end
  
  def ==(other)
    self.to_s == other.to_s
  end
  
  def to_s
    Guess.to_letters(@value)
  end
  
  def last?
    "FFFF" == to_s
  end

  def self.to_letters(number)
    pad_with_as(number.to_s(BASE).tr("0-5", "A-F"))
  end

private
  
  def self.pad_with_as(string)
    "A" * (LENGTH-string.length) + string
  end  
end
