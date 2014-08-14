
class Integer
  def pentagonal?
    a = ((1 + 24 * self) ** 0.5 + 1) / 6.0
    (a - a.to_i).abs < 1.0e-12
  end

  def hexagonal?
    a = ((1 + 8 * self) ** 0.5 + 1) / 4.0
    (a - a.to_i).abs < 1.0e-12
  end
end

triangles = (286..Float::INFINITY).lazy.collect { |n| n * (n + 1) / 2 }
puts triangles.detect { |n| n.pentagonal? and n.hexagonal? }
