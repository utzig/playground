#!/usr/bin/env ruby

def fact(n)
  total = 1
  (2..n).each { |v| total = total * v }
  total
end

t = gets.chomp.to_i

t.times do
  n = gets.chomp.to_i
  puts fact(n)
end
