class GuessNum
  attr_reader :secret, :last_message
  def initialize(max = 100)
    @max, @secret = max, rand(max)
    @last_message = prompt
  end

  def correct?(guess)
    correct = false

    if !(guess =~ /^-?\d+/)
      @last_message = "Bad input! #{guess} is not an integer"
      return correct
    end

    num     = guess.to_i

    if num.to_f != guess.to_f
      @last_message = "Bad input! #{guess} is a float, not an integer"
      return correct
    end

    @last_message = begin
      if num > @max || num < 0
        "Bad input! #{prompt}"
      elsif num < @secret
        "Wrong! Guess higher"
      elsif num > @secret
        "Wrong! Guess lower"
      elsif num == @secret
        correct = true
        "Correct!"
      end
    end
    correct
  end
  
  private
  def prompt
    "Please enter an integer between 0 and #{@max}"
  end
end