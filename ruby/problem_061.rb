
class Integer
  def head_str
    to_s[0..1]
  end

  def tail_str
    to_s[2..3]
  end
end

class Array
  def cyclic?
    first.head_str == last.tail_str
  end
end

def seq_gen f
  nlazy = (1..Float::INFINITY).lazy
  limited = nlazy.collect{ |n| f.(n) }.take_while{ |e| e < 10_000 }.drop_while{ |e| e < 1_000 }
  limited.force
end

def intersection seq1, seq2
  seq1.collect{ |ary1|
    tail = ary1.last.tail_str
    matched_ary = seq2.select{ |n| n.head_str == tail }
    unless matched_ary.empty?
      matched_ary.collect{ |e| ary1.dup << e }
    else
      nil
    end
  }.compact.flatten(1)
end


triangle   = seq_gen(->(n){ n * (n + 1) / 2 })
square     = seq_gen(->(n){ n ** 2 })
pentagonal = seq_gen(->(n){ n * (3 * n - 1) / 2 })
hexagonal  = seq_gen(->(n){ n * (2 * n - 1) })
heptagonal = seq_gen(->(n){ n * (5 * n - 3) / 2 })
octagonal  = seq_gen(->(n){ n * (3 * n - 2) })
seqs = [triangle, square, pentagonal, hexagonal, heptagonal, octagonal]

ans = nil
seqs.permutation.detect do |a, b, c, d, e, f|
  inter1 = intersection(a.collect{ |n| [n] }, b)
  inter2 = intersection(inter1, c)
  inter3 = intersection(inter2, d)
  inter4 = intersection(inter3, e)
  inter5 = intersection(inter4, f)
  ans = inter5.detect(&:cyclic?)
end
p ans
p ans.inject(:+)

