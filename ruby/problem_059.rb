require 'csv'

CIPHER = CSV.read("cipher1.txt").flatten.collect(&:to_i)

def decode key
  key_seq = key.bytes.cycle.lazy
  txt = []
  CIPHER.zip(key_seq) { |a, b| txt << (a ^ b).chr }
  txt
end

def popular_words txt_arg
  txt = txt_arg.dup.collect(&:downcase)
  words = txt.join.split
  if words.length > 50
    words.group_by { |w| w }.sort_by { |a| a[1].length }.last.first
  else
    nil
  end
end

def popular_chars txt_arg
  txt = txt_arg.dup
  [" ", ","].each { |c| txt.delete(c) }
  txt.group_by { |e| e }.sort_by { |a| a[1].length }.last(5).collect(&:first).reverse
end

ans = ('a'..'z').to_a.repeated_permutation(3).select do |key|
  txt = decode(key.join)
  pop = popular_words(txt)
  pop == 'the' or pop == 'a' or pop == 'an'
end

ans.each do |ary|
  key = ary.join
  puts "key = #{key}"
  txt = decode(key).join
  p txt
  puts "ans = #{txt.bytes.inject(:+)}"
  puts
end
