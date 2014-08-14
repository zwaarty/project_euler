PENTAGONALS = (1..Float::INFINITY).lazy.collect { |n| (n + 1) * (3 * (n + 1) - 1) / 2 }

def pentagonal? n
  a = ((1 + 24 * n) ** 0.5 + 1) / 6.0
  (a - a.to_i).abs < 1.0e-12
end

pk, pj = nil

pk = PENTAGONALS.detect do |t1|
  pj = PENTAGONALS.take_while { |t2| t2 < t1 }.reverse_each.detect do |t3|
    pentagonal?(t1 + t3) and pentagonal?(t1 - t3)
  end
end

puts pk - pj
