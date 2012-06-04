require "minitest/autorun"

require "guess"
require "game"

class GameTest < MiniTest::Unit::TestCase
  
  def setup
    @game = Game.new
  end
  
  def test_empty_score_requires_to_change_cards
    @game.remember "AAAA", ""
    
    assert_compatible "BBBB"
    assert_compatible "BCDE"
    assert_compatible "FFFF"
    assert_not_compatible "AAAA"
    assert_not_compatible "ABBB"
  end

  def test_compatibility_agains_single_minus
    @game.remember "ABCD", "-"
    
    assert_not_compatible "FFFF"
    assert_not_compatible "AAAA"
    assert_not_compatible "AAAF"
    assert_not_compatible "AAFF"
    assert_compatible "CFFF"
  end

  def test_compatibility_against_more_entries
    @game.remember "AAAA", ""
    @game.remember "BBBB", ""
    
    assert_not_compatible "AFFF"
    assert_not_compatible "BFFF"
    assert_compatible "FFFF"
  end
  
  private
  
  def assert_compatible(guess)
    assert @game.compatible?(Guess.new(guess)), 
      "#{guess} should be compatible with #{@game}"
  end

  def assert_not_compatible(guess)
    refute @game.compatible?(Guess.new(guess)), 
      "#{guess} should NOT be compatible with #{@game}"
  end
end
