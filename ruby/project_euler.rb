require 'prime'
require 'set'
require 'benchmark'

class Integer
  def factorial
    (1..self).inject(&:*) || 1
  end

  def sieve_of_eratosthenes
    arr = [*2..self]
    primes = []
    bound = Math.sqrt self
    loop do
      primes << pr = arr.first
      arr.reject! {|i| i % pr == 0}
      break unless arr.first < bound
    end
    primes + arr
  end

  def to_chars
    to_s.chars
  end

  def to_digits
    to_chars.collect(&:to_i)
  end

  def palindromic?
    to_s == to_s.reverse
  end

  def pandigital?
    to_digits.sort == [*1..to_digits.length]
  end
end


class Array
  def to_integer
    collect(&:to_s).join.to_i
  end
end
