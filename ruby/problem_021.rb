# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

require 'set'

def sum_of_proper_divisors n
  divs = Set.new
  divs << 1
  2.upto(n/2) do |i|
    if n % i == 0 then
      divs << i
      divs << n / i
    end
  end
  divs.inject(&:+)
end

ds = (1...10_000).map { |n| sum_of_proper_divisors n }
amicables = (2...10_000).collect do |a|
  b = ds[a - 1]
  x = ds[b - 1]
  if x == a and a != b
    a
  else
    0
  end
end

p xx = amicables.select(&:nonzero?)
p xx.map {|n| ds[n - 1]}
puts amicables.inject(&:+)
