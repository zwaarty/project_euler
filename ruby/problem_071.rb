list = [*1..1_000_000].collect{ |n| Rational((3/7r * n).to_i, n) } - [3/7r]
p list.max.numerator
