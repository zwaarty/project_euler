
triangle = []
open('triangle.txt') do |f|
  while line = f.gets
    triangle << line.split.collect(&:to_i)
  end
end

len = triangle.last.length
cache = {}
(0..len-1).each{ |i| cache[[len-1, i]] = triangle[len-1][i] }

define_method :max_total do |i, j|
  return cache[[i, j]] if cache[[i, j]]
  left  = cache[[i + 1, j    ]] = max_total(i + 1, j    )
  right = cache[[i + 1, j + 1]] = max_total(i + 1, j + 1)
  cache[[i, j]] = triangle[i][j] + (left > right ? left : right)
end

p max_total(0, 0)
