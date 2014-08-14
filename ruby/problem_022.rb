# Using names.txt (right click and 'Save Link/Target As...'),
# a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order,
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
# So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

require 'csv'

class String
  def score
    downcase.bytes.to_a.map{ |n| n - ("a".bytes.to_a[0] - 1) }.reduce(&:+)
  end
end

names = CSV.read("names.txt").flatten.sort
p names.map.with_index(1) { |name, i| name.score * i }.reduce(&:+)
