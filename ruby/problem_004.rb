# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

require 'benchmark'

def palindromic? num
  num.to_s == num.to_s.reverse
end

palindromics = Array.new
999.downto(100) do |i|
  candidate = 10000
  i.downto(100) do |j|
    num = i * j
    break if num < candidate
    if palindromic? num
      palindromics << [num, i, j]
      candidate = num
    end
  end
end

ans = palindromics.map(&:first).max
puts "ans = #{ans}"

Benchmark.bmbm(10) do |x|
  x.report("brute force:") do
    palindromics.map(&:first).max
  end
end
