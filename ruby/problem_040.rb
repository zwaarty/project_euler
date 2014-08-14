frac_seq = (1..Float::INFINITY).lazy.collect_concat { |n| n.to_s.chars.collect(&:to_i) }

digits = []
(0..6).each do |i|
  digits << frac_seq.drop(10 ** i - 1).first
end

p digits.inject(&:*)
