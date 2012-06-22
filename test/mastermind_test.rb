require "test/unit"

require "master_mind"

class MasterMindTest < Test::Unit::TestCase
  
  def test_single_guess_scenario
    start_game
    assert_matches /[A-F]{4}/, current_guess
    respond_with "++++"
    assert_victory
  end
    
  def test_two_guesses_scenario_with_enum_strategy
    start_game
    assert_equal "AAAA", current_guess
    respond_with ""
    assert_no_victory
    assert_equal "BBBB", current_guess    
  end
  
  def test_uncle_bobs_example
    #             FEAD
    start_game
    assert_equal "AAAA", current_guess
    respond_with "+"
    assert_equal "ABBB", current_guess    
    respond_with "-"
    assert_equal "CACC", current_guess    
    respond_with "-"
    assert_equal "DDAD", current_guess    
    respond_with "++"
    assert_equal "DEAE", current_guess    
    respond_with "-++"
    assert_equal "FDAE", current_guess    
    respond_with "--++"
    assert_equal "FEAD", current_guess    
    respond_with "++++"
    assert_victory
  end
  
  # def test_bad_scoring_is_recognized
  #   start_game
  #   assert_equal "AAAA", current_guess
  #   respond_with ""
  #   assert_equal "BBBB", current_guess    
  #   respond_with ""
  #   assert_equal "CCCC", current_guess    
  #   respond_with ""
  #   assert_equal "DDDD", current_guess    
  #   respond_with ""
  #   assert_equal "EEEE", current_guess    
  #   respond_with ""
  #   assert_equal "FFFF", current_guess    
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
  
  private 
  
  def start_game
    @master_mind = MasterMind.new
  end
  
  def current_guess
    @master_mind.guess.to_s
  end
  
  def respond_with score
    @master_mind.respond_with score
  end
  
  def assert_victory
    assert @master_mind.victory?, "should be victory"
  end
  
  def assert_no_victory
    refute @master_mind.victory?, "should be no victory"
  end
  
  def assert_matches pattern, string
    assert pattern =~ string, "#{pattern} should match #{string}"
  end   
end