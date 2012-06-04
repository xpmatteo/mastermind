require "test/unit"

require "guess"

class TestGuess < Test::Unit::TestCase
  def test_successor_of_AAAA_is_AAAB
    aaaa = Guess.new("AAAA")
    assert_equal Guess.new("AAAB"), aaaa.succ 
  end
  
  def test_number_to_letters
    assert_equal "AAAB", Guess.to_letters(1)
    assert_equal "AAAC", Guess.to_letters(2)
    assert_equal "AABA", Guess.to_letters(6)
    assert_equal "ABAA", Guess.to_letters(6*6)
    assert_equal "FFFF", Guess.to_letters(6*6*6*6-1)
  end
  
  def test_guess_to_s
    assert_equal "AAAA", Guess.new("AAAA").to_s
    assert_equal "FFFE", Guess.new("FFFE").to_s
    assert_equal "FFFF", Guess.new("FFFF").to_s
  end
  
  def test_FFFF_is_last_in_sequence
    assert Guess.new("FFFF").last?, "FFFF should be last"
    refute Guess.new("FFFE").last?, "FFFE"
    refute Guess.new("AAAA").last?, "AAAA"
  end
  
end