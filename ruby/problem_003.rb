# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'prime'
require 'benchmark'

def max_of_prime_division n
  Prime.prime_division(n).last.first
end

Benchmark.bm do |x|
  x.report("stdlib:") do
    ans = max_of_prime_division 600851475143
    puts "ans = #{ans}"
  end
end
