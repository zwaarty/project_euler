require_relative 'project_euler'

class Integer
  def truncatable_prime?
    digits = to_digits
    len = digits.length
    (0...len).all? do |i|
      digits.drop(i).to_integer.prime? and digits.take(len - i).to_integer.prime?
    end
  end
end

p seq = Prime.each.lazy.select(&:truncatable_prime?).take(15).force
p seq.drop(4).inject(&:+)
