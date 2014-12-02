#!/usr/bin/env ruby

class Sieve
  def initialize(max)
    @sieve = sieve(max)
    @sieve_max = @sieve.max
  end

  # precalc sieve of erastothenes to sqrt(max)
  def sieve(max)
    last = Math.sqrt(max)
    a = (0..last).to_a
    a[0] = a[1] = nil
    a.each do |v|
      next unless v
      (v*v).step(last, v) { |i| a[i] = nil }
    end
    a.compact!
  end

  def segmented_sieve(min, max)
    pre = []

    # try to use pre-calculated sieve
    if min <= @sieve_max && max <= @sieve_max
      # all number already calculated
      return @sieve.select { |v| v >= min and v <= max }

    elsif min <= @sieve_max
      # some number calculated
      pre = @sieve.select { |v| v >= min }
    end

    initial = @sieve_max + 1
    initial = min if pre.empty?

    a = (initial..max).to_a
    max_index = max - initial
    @sieve.each do |v|
      m = (initial / v) * v
      m += v if m < initial
      (m - initial).step(max_index, v) { |i| a[i] = nil }
    end

    if pre.empty?
      a.compact!
    else
      pre + a.compact!
    end
  end
end

sieve = Sieve.new(1000000000)
n = gets.chomp.to_i
n.times do
  min, max = gets.chomp.split(' ').map(&:to_i)
  primes = sieve.segmented_sieve(min, max)
  primes.each { |v| puts v }
  puts
end
