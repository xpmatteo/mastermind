class Array
  def delete_one(match)
    for i in (0...size)
      if match == self[i]
        self.delete_at(i)
        return
      end
    end
  end
end

Score = Struct.new(:plus_count, :minus_count) do
  def self.compare(guess, code)
    guess = guess.to_s
    code = code.to_s    
    plusses = plusses(guess, code)
    minuses = minuses(guess, code) - plusses
    Score.new(plusses, minuses)
  end
  
  def self.from_string(string)
    Score.new string.count("+"), string.count("-")
  end
  
  def to_s
    "Score<#{"+" * plus_count}#{"-" * minus_count}>"
  end
  
  private
  
  def self.plusses(a, b)
    result = 0
    for index in 0...(a.length)
      result += 1 if a[index] == b[index]
    end
    result
  end
  
  def self.minuses(a, b)
    result = 0
    b = b.chars.to_a
    for char in a.chars
      if b.include? char
        result += 1
        b.delete_one char
      end
    end
    result
  end
end