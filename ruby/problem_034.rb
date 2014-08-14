# Digit factorials
# Problem 34

class Integer
  def factorial
    (1..self).inject(&:*) || 1
  end
  def curius?
    self == self.to_s.chars.collect{ |n| n.to_i.factorial }.inject(&:+)
  end
end

p (11..9.factorial*7).select(&:curius?).inject(&:+)