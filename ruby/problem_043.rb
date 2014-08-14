
class Integer
  def interesting?
    arr = to_s.chars.each_cons(3).to_a[1..-1].collect(&:join).collect(&:to_i)
    arr.div([2, 3, 5, 7, 11, 13, 17]).all? { |w| w.zero? }
  end
end

class Array
  def div arr
    ans = []
    each_with_index { |elm, i| ans << elm % arr[i] }
    ans
  end
end

divisible = []
[*0..9].permutation do |arr|
  next if arr.first == 0
  num = arr.collect(&:to_s).join.to_i
  divisible << num if num.interesting?
end
p divisible.inject(:+)
