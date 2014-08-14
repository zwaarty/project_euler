

# def powerful? base, power
#   (base ** power).to_s.length == power
# end

def find_powerful_nth nth
  ans = []
  (1..Float::INFINITY).each do |e|
    num = e ** nth
    len = num.to_s.length
    if len == nth
      ans << num
    elsif len > nth
      break
    end
  end
  ans
end

ans = []
(1..Float::INFINITY).each do |nth|
  ary = find_powerful_nth nth
  unless ary.empty?
    ans << ary
  else
    break
  end
end

p ans.flatten.length
