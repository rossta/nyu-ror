$:.unshift File.join(File.dirname(__FILE__), "lib")
require 'guess_num'

max = (ARGV.shift || 100).to_i
guess_num = GuessNum.new(max)

puts guess_num.last_message

while guess = gets.chomp
  break if guess_num.correct?(guess)
  puts guess_num.last_message
end

puts guess_num.last_message
puts '==fin=='
