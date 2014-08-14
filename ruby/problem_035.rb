# Circular primes
# Problem 35

require 'prime'

class Integer
  def circular_prime?
    str = to_s.chars
    (1...str.length).each do |i|
      return false unless str.rotate(i).join.to_i.prime?
    end
    true
  end
end

p Prime.each(1_000_000).select { |n| n.circular_prime? }.length
