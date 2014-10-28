#!/usr/bin/env ruby

t = gets.chomp.to_i

t.times do
  x, y = gets.chomp.split(' ').map(&:to_i)
  if x == y
    puts x * 2 - x % 2
  elsif x > 1 && x-2 == y
    puts x + y - x % 2
  else
    puts 'No Number'
  end
end
