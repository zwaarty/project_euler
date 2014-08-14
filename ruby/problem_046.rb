require 'prime'

class Integer
  def goldbach_conjecture?
    Prime.each(self).detect do |pr|
      a = ((self - pr) / 2.0 ) ** 0.5
      (a - a.to_i) < 1.0e-12
    end
  end
end

ODD_COMPOSITE = (3..Float::INFINITY).lazy.select { |n| n.odd? and not n.prime? }

p ODD_COMPOSITE.detect { |oc| not oc.goldbach_conjecture? }
