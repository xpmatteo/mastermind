require "test/unit"

require "enumeration_strategy"

class MasterMind
  def initialize
    @strategy = EnumerationStrategy.new
  end
  
  def guess
    "AAAA"
  end
  
  def victory?
    
  end
end

class MasterMindTest < Test::Unit::TestCase
  def start_game
    @master_mind = MasterMind.new
  end
  
  def current_guess
    @master_mind.guess
  end
  
  def respond_with guess
    
  end
  
  def assert_victory
    assert @master_mind.victory?, "should be victory"
  end
  
  def assert_matches pattern, string
    assert pattern =~ string, "#{pattern} should match #{string}"
  end
  
  def test_single_guess_scenario
    start_game
    assert_matches /[A-F]{4}/, current_guess
    respond_with "++++"
    assert_victory
  end
    
  # def test_two_guesses_scenario_with_enum_strategy
  #   start_game
  #   assert_matches "AAAA", guess
  #   respond_with ""
  #   assert_no_victory
  #   assert_matches "BBBB", guess    
  # end
  # 
  # def test_bad_scoring_is_recognized
  #   start_game
  #   assert_matches "AAAA", guess
  #   respond_with ""
  #   assert_matches "BBBB", guess    
  #   respond_with ""
  #   assert_matches "CCCC", guess    
  #   respond_with ""
  #   assert_matches "DDDD", guess    
  #   respond_with ""
  #   assert_matches "EEEE", guess    
  #   respond_with ""
  #   assert_matches "FFFF", guess    
  #   respond_with ""
  #   assert_bad_scoring
  # end
  # 
  # def test_bad_scoring_variation
  #   start_game
  #   assert_matches "AAAA", guess
  #   respond_with "----"
  #   assert_bad_scoring
  # end
  # 
end