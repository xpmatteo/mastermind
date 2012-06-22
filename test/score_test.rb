require "test/unit"

require "score"
require "guess"

class TestScore < Test::Unit::TestCase
  def test_nothing_in_common
    assert_score "", "AAAA", "BBBB"
  end
  
  def test_one_plus
    assert_score "+", "AAAA", "BABB"
    assert_score "+", "AAAA", "BBBA"
  end
  
  def test_one_minus
    assert_score "-", "ABCD", "FAFF"
    assert_score "-", "ABCD", "FFFC"
  end
  
  def test_two_plus_two_minus
    assert_score "++--", "ABCD", "ACBD"
  end
  
  def test_score_from_string
    assert_equal Score.new(1, 2), Score.from_string("+--")
  end
  
  def test_is_victory
    assert Score.from_string("++++").victory?, "should be victory"
  end
  
  private 
  
  def assert_score expected_score, a, b
    message = "expected score #{expected_score} for #{a}.score(#{b})"
    assert_equal Score.from_string(expected_score), 
      Score.compare(a, b)
  end
end