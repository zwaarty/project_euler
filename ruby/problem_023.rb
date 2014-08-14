# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28,
# which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and
# it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater than 28123 can be written
# as the sum of two abundant numbers. However,
# this upper limit cannot be reduced any further by analysis
# even though it is known that the greatest number that cannot be expressed
# as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'set'

class Integer
  def proper_divisors
    divs = Set.new
    divs << 1
    2.upto(Math.sqrt(self)) do |i|
      if self % i == 0 then
        divs << i
        divs << self / i
      end
    end
    divs.to_a
  end

  def perfect?
    proper_divisors.inject(&:+) == self
  end

  def deficient?
    proper_divisors.inject(&:+) < self
  end

  def abundant?
    proper_divisors.inject(&:+) > self
  end
end


MAX = 28123
abundants = (1..MAX).select(&:abundant?)
sum_of_two = (abundants.combination(2).collect { |m, n| m + n } + abundants.collect{ |n| n * 2 }).sort.uniq
non_abundant_sum = (1..MAX).to_a - sum_of_two
p non_abundant_sum.inject(&:+)
