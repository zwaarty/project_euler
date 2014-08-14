# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

cache = {[1,1] => 2}
define_method :routes do |m, n|
  if m.zero? or n.zero? then
    1
  else
    cache[[m, n]] ||= routes(m - 1, n) + routes(m, n - 1)
  end
end

puts routes(20, 20)
