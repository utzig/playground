#!/usr/bin/env ruby

t = gets.chomp.to_i

t.times do
  n, m = gets.chomp.split(' ')
  nm = n.reverse.to_i + m.reverse.to_i
  puts nm.to_s.reverse.to_i
end
