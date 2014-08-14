require 'fiber'

class Rational
  def num_digits_gt_den_digits?
    self.numerator.to_s.length > self.denominator.to_s.length
  end
end

def expand_sqrt2
  Fiber.new do
    t = 1 + 1/2r
    Fiber.yield t
    loop do
      t = 1 + Rational(1, 1 + t)
      Fiber.yield t
    end
  end
end

gen = expand_sqrt2
count = 0
1_000.times { count += 1 if gen.resume.num_digits_gt_den_digits? }
p count
