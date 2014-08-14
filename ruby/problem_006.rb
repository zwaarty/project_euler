# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers
# and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers
# and the square of the sum.

require 'benchmark'

def sumsq_brute n
  [*1..n].map { |i| i ** 2 }.inject(&:+)
end

def sum_brute n
  [*1..n].inject(&:+)
end

def sumsq_formula n
  n * (n + 1) * (2 * n + 1) / 6
end

def sum_formula n
  n * (n + 1) / 2
end

def brute n
  sum_brute(n) ** 2 - sumsq_brute(n)
end

def formula n
  sum_formula(n) ** 2 - sumsq_formula(n)
end

n = 100
puts brute n
puts formula n

Benchmark.bm(10) do |x|
  x.report("brute:") { brute n }
  x.report("formula:") { formula n }
end
