
class Integer
  def relatively_prime? n
    self.gcd(n) == 1
  end

  def totient
    [*1...self].select{ |i| i.odd? and self.relatively_prime?(i) }.length
  end
end

# φ関数の値域の下限は y = 4x / 15
# http://ja.wikipedia.org/wiki/オイラーのφ関数
seq = (1..Float::INFINITY).lazy.collect{ |i| i * 30 }.take_while{ |i| i <= 1_000_000 }.force
max = 0
max_phi = 0
seq.each do |n|
  term = n / n.totient.to_f
  if term > max_phi
    max = n
    max_phi = term
  end
  if n % 1000 == 0
    puts "n = #{n}, max = #{max}, max_phi = #{max_phi}"
  end
end

