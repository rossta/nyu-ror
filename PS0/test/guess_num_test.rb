$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'test/unit'
require 'guess_num'

class GuessNumTest < Test::Unit::TestCase
  def setup
    @guess_num = GuessNum.new
    @secret    = @guess_num.secret
  end
  
  def test_ask_for_new_guess
    assert_equal "Please enter an integer between 0 and 100", @guess_num.last_message
  end

  def test_guess_number_equal_secret
    correct   = @guess_num.correct?(@secret.to_s)

    assert correct
    assert_equal "Correct!", @guess_num.last_message
  end


  def test_guess_number_less_than_secret
    correct   = @guess_num.correct?((@secret - 1).to_s)

    assert !correct
    assert_equal "Wrong! Guess higher", @guess_num.last_message
  end

  def test_guess_number_more_than_secret
    correct   = @guess_num.correct?((@secret + 1).to_s)

    assert !correct
    assert_equal "Wrong! Guess lower", @guess_num.last_message
  end

  def test_guess_number_with_letters
    correct  = @guess_num.correct?("chunky")

    assert !correct
    assert_equal "Bad input! chunky is not an integer", @guess_num.last_message
  end

  def test_guess_number_with_float
    correct  = @guess_num.correct?("1.5")

    assert !correct
    assert_equal "Bad input! 1.5 is a float, not an integer", @guess_num.last_message
  end
  
  def test_guess_higher_than_max
    correct = @guess_num.correct?("101")
    
    assert !correct
    assert_equal "Bad input! Please enter an integer between 0 and 100", @guess_num.last_message
  end

  def test_guess_lower_than_max
    correct = @guess_num.correct?("-1")
    
    assert !correct
    assert_equal "Bad input! Please enter an integer between 0 and 100", @guess_num.last_message
  end

end