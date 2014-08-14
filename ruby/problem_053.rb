class Integer
  def factorial
    (1..self).inject(:*) || 1
  end
end

def cnr n, r
  n.factorial / r.factorial / (n - r).factorial
end

cands = []
[*1..100].repeated_combination(2) do |r, n|
  if num = cnr(n, r) > 1_000_000
    cands << num
  end
end

p cands.length
