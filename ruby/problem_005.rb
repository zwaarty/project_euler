# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'prime'
require 'benchmark'

def use_lcm n
  (1..n).inject(&:lcm)
end

def use_prime_division n
  factor_map = (1..n).collect { |i| Prime.prime_division i }.flatten(1).group_by(&:first)
  factor_map.inject(1) do |mem, (key, val)|
    mem *= key ** val.collect(&:last).max
  end
end

puts use_lcm 20
puts use_prime_division 20

Benchmark.bm(20) do |x|
  x.report("use_lcm:") { use_lcm 20 }
  x.report("use_prime_division:") { use_prime_division 20 }
end
