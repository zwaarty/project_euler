# Digit fifth powers
# Problem 30
#
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

class Array
  def to_num
    self.collect{ |n| n ** 5 }.inject(&:+)
  end
end

class Integer
  def sum_of_fifth_powers?
    self == self.to_s.chars.collect(&:to_i).to_num
  end
end

seq = (2..6*9**5).select(&:sum_of_fifth_powers?)

p seq
p seq.inject(&:+)
