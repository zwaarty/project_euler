
def square? n
  root = n ** 0.5
  (root.round - root).abs < 1.0e-12 ? root.round : false
end

def large_diophantine? d
  ans = nil
  n = 1
  loop do
    x = square?(1 + d * n**2)
    return x if x
    n += 1
    return false if n > 1_000_000_000
  end
end

seq = (1..1000).reject{ |d| square? d }.collect{ |d| p d; [large_diophantine?(d), d] }
p seq
p seq.max
