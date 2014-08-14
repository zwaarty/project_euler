
cache = {}
ans = nil

(0..Float::INFINITY).detect do |n|
  num = n ** 3
  key = num.to_s.chars.sort.join
  if cache[key]
    cache[key] = cache[key] << num
  else
    cache[key] = [num]
  end

  if cache[key].length == 5
    ans = cache[key]
    true
  else
    nil
  end
end

p ans.sort
