require 'csv'

class String
  def to_score
    downcase.codepoints.collect{ |c| c - ("a".codepoints.first - 1) }.inject(:+)
  end
end

class Triangle
  include Enumerable
  def self.each
    n = 1
    loop do
      yield n * (n + 1) / 2
      n += 1
    end
  end
end

class Integer
  def triangle?
    Triangle.each do |tri|
      if self == tri
        return true
      elsif self < tri
        return false
      end
    end
  end
end

p CSV.read("words.txt").flatten.collect(&:to_score).select(&:triangle?).length
