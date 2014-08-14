
def fractionals d
  upper = (1/2r * d).floor
  lower = (1/3r * d).ceil
  (lower..upper).collect{ |n| n/d.to_r }
end

seq = (1..12_000).collect_concat{ |d| fractionals d }.uniq - [1/2r, 1/3r]
p seq.length
