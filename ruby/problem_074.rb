class Integer
  def factorial
    (1..self).inject(:*) || 1
  end

  def digit_factorial
    to_s.chars.collect{ |d| d.to_i.factorial }.inject(:+)
  end
end

$memo = {169 => 3, 363601 => 3, 1454 => 3, 871 => 2, 45361 => 2, 872 => 2, 45362 => 2}
def loop_length n
  return $memo[n] if $memo[n]
  df = n.digit_factorial
  n == df ? ($memo[n] = 1) : ($memo[n] = 1 + loop_length(df))
end

p (1..1_000_000).select{ |n| loop_length(n) == 60 }.length

