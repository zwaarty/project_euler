ans = (1..Float::INFINITY).detect do |n|
  (1..6).collect { |i| (n * i).to_s.chars.sort.join.to_i  }.uniq.length == 1
end
p ans
