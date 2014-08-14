
@cache = {}

def patterns_of sum, maximum
  my_pattern = [sum, maximum]
  return @cache[my_pattern] if @cache[my_pattern]
  return @cache[my_pattern] = 1 if sum < 1

  ans = 0
  left = my_pattern.min
  rest = (sum - left)
  loop do
    break if left.zero?
    ans += patterns_of(rest, left)
    left -= 1
    rest += 1
  end

  @cache[my_pattern] = ans
end

p patterns_of(100, 99)
