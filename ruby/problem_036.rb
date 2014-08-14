# Double-base palindromes
# Problem 36

class Integer
  def palindromic?
    to_s == to_s.reverse
  end
  def palindromic_in_binary?
    to_s(2) == to_s(2).reverse
  end
end

p (0...1_000_000).select{ |n| n.palindromic? and n.palindromic_in_binary? }.inject(&:+)
