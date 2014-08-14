# Quadratic primes
# Problem 27
#
# Euler discovered the remarkable quadratic formula:
#
# n² + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
# However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41,
# 41² + 41 + 41 is clearly divisible by 41.
# The incredible formula  n² − 79n + 1601 was discovered,
# which produces 80 primes for the consecutive values n = 0 to 79.
# The product of the coefficients, −79 and 1601, is −126479.
# Considering quadratics of the form:
#
# n² + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n, starting with n = 0.

require 'prime'

def qudratic_formula a, b
  ->(n) {n ** 2 + a * n + b}
end

def num_of_consecutive_primes a, b
  func = qudratic_formula a, b
  (0..Float::INFINITY).each do |i|
    return i - 1 unless Prime.prime? func.call(i)
  end
end

max_len, aa, bb = 0, 0, 0
(-999..999).each do |a|
  (-999...999).each do |b|
    len = num_of_consecutive_primes a, b
    if len > max_len
      max_len = len
      aa, bb = a, b
    end
  end
end

ans = aa * bb
puts ans, max_len, aa, bb
