require 'prime'

seed = [*0..9].repeated_permutation(4).collect { |arr| arr.collect(&:to_s).join.to_i }.select(&:prime?)
grouped = seed.group_by { |n| n.to_s.chars.sort }

candidates = []
grouped.each do |k, v|
  v.combination(3) do |triplet|
    candidates << triplet if triplet[2] - triplet[1] == triplet[1] - triplet[0]
  end
end

puts candidates.reject { |arr| arr.include? 1487 }.join
