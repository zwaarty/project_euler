require_relative 'project_euler'

class Integer
  def concatnated_product arr
    arr.collect { |n| n * self }.to_integer
  end
end

seq = []
(2..9).each do |n|
  lower = 10 ** (9 / n - 1)
  upper = 10 ** (9 / n + 1)
  (lower..upper).each do |m|
    cand = m.concatnated_product [*1..n]
    seq << cand if cand.pandigital?
  end
end

p seq
p seq.max
