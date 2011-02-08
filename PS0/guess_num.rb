#!/usr/local/bin/ruby -w

$:.unshift File.join(File.dirname(__FILE__), "lib")
require 'guess_num'

if $0 == __FILE__
  max = (ARGV.shift || 100).to_i
  guess_num = GuessNum.new(max)

  puts guess_num.last_message

  while guess = gets.chomp
    break if guess_num.correct?(guess)
    puts guess_num.last_message
  end

  puts guess_num.last_message
  puts '==fin=='
end

