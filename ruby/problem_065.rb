
def e_fraction nth
  seq = [2]
  n = 2
  k = 1
  loop do
    break if n > nth
    seq << 1
    n += 1

    break if n > nth
    seq << 2 * k
    n += 1
    k += 1

    break if n > nth
    seq << 1
    n += 1
  end

  den = seq.reverse
  t = den.shift.to_r
  until den.empty?
    t = den.shift.to_r + 1 / t
  end
  t
end

p e_fraction(100).numerator.to_s.chars.collect(&:to_i).inject(:+)
