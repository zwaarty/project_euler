class Integer
  def reverse
    self.to_s.reverse.to_i
  end

  def palindromic?
    self == reverse
  end

  def revadd
    self + reverse
  end

  def lycrel?
    cache = self
    49.times do |i|
      cache = cache.revadd
      return false if cache.palindromic?
    end
    true
  end
end

lycrels = (0...10_000).select(&:lycrel?)
p lycrels.length
