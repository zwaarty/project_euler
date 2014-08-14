require 'prime'

prime_seq = Prime.each(1_000_000).to_a
len = prime_seq.length

cand = []
0.upto(len - 2).each do |i|
  sum = prime_seq[i]
  (i + 1).upto(len - 1).each do |j|
    sum += prime_seq[j]
    break if sum > 1_000_000
    cand << [sum, j - i + 1]  if sum.prime?
  end
end

arr = cand.group_by { |a| a.last }
p k = arr.keys.max
p arr[k]
