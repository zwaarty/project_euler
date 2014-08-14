# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require 'continuation'
require 'amb'
require 'benchmark'

def brute n
  callcc do |cc|
    1.upto(n-2) do |a|
      a.upto(n-1) do |b|
        c = n - a - b
        if a ** 2 + b ** 2 == c ** 2 then
          puts "a = #{a}, b = #{b}, c = #{c}"
          puts "abc = #{a * b * c}"
          cc.call
        end
      end
    end
  end
end

def use_amb n
  ambclass = Class.new {include Amb}
  ambclass.solve_all do |amb|
    a = amb.choose *(1..n)
    b = amb.choose *(1..n)
    c = amb.choose *(1..n)
    amb.assert a + b + c == n
    amb.assert a ** 2 + b ** 2 == c ** 2
    puts "a = #{a}, b = #{b}, c = #{c}"
    puts "abc = #{a * b * c}"
  end
end

n = 1000
puts brute n
# puts use_amb n  # too slow!

Benchmark.bm(10) do |x|
  x.report("brute:") { brute n }
  # x.report("use_amb:") { use_amb n }  # too slow!
end
