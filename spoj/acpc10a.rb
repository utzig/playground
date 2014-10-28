#!/usr/bin/env ruby

while true
  begin
    n, m, p = gets.chomp.split(' ').map(&:to_i)
  rescue NoMethodError
    exit
  end

  next if n == m || m == p

  if p - m == m - n
    puts "AP #{p - m + p}"
  elsif m != 0 && n != 0 && p / m == m / n
    puts "GP #{p * (p / m)}"
  end
end
