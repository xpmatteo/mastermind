require "test/unit"

require "enumeration_strategy"

class TestEnumerationStrategy < Test::Unit::TestCase
  def setup
    @strategy = EnumerationStrategy.new    
  end
  
  def test_first_guess_is_AAAA
    assert_next_guess "AAAA"
  end
  
  def test_second_guess_is_next_compatible_guess
    remember "AAAA", ""
    assert_next_guess "BBBB"
  end
  
  def test_returns_nil_if_no_solution
    remember "AAAA", "-"
    assert_nil @strategy.next_guess
  end
  
  def test_when_solution_found_it_always_returns_it
    remember "ABCD", "++++"
    assert_next_guess "ABCD"
  end
  
  def test_guesses_FFFF
    remember "FFFF", "++++"
    assert_next_guess "FFFF"
  end
  
  private
  
  def assert_next_guess(expected)
    assert_equal Guess.new(expected), @strategy.next_guess    
  end
  
  def remember guess, score
    @strategy.remember Guess.new(guess), Score.from_string(score)
  end
end