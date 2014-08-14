# f the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?



class Numeric
  Words1 = %w(nil one two three four five six seven eight nine ten
              eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  Words2 = %w(nil nil twenty thirty forty fifty sixty seventy eighty ninety)

  def comvert_word_within_99
    arr = Array.new
    if (1..19).include? self then
      arr << Words1[self]
    elsif (20..99).include? self then
      n1, n2 = self % 10, self / 10
      arr << Words2[n2] << Words1[n1]
    end
    arr.reject { |n| n == "nil" }
  end

  def convert_word_array
    arr = Array.new
    if (1..99).include? self then
      arr << self.comvert_word_within_99
    elsif (100..999).include? self then
      n12, n3 = self % 100, self / 100
      arr << Words1[n3] << "hundred"
      n12arr = n12.comvert_word_within_99
      arr << "and" << n12arr unless n12arr.empty?
    elsif self == 1000
      arr << "one" << "thousand"
    else
      raise "Not allowed number : #{self}"
    end
    arr.flatten
  end
end

p (1..1000).collect(&:convert_word_array).collect.with_index {|arr, i|
  siz = arr.collect(&:size).inject(&:+)
  puts "#{i+1}: #{arr}: #{siz}"
  siz
}.inject(&:+)
