maxsum = 0

[*1...100].repeated_permutation(2) do |arr|
  ab = arr[0] ** arr[1]
  sum = ab.to_s.chars.collect(&:to_i).inject(:+)
  maxsum = [maxsum, sum].max
end

puts maxsum

