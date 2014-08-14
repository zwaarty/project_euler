# Digit canceling fractions
# Problem 33

vals = []
(1..9).each do |n2|
  (1..9).each do |n1|
    (n2..9).each do |d2|
      (1..9).each do |d1|
        num = [n2, n1].collect(&:to_s).join.to_i
        den = [d2, d1].collect(&:to_s).join.to_i
        next unless num < den

        rat = Rational(num, den)
        if n2 == d2 && Rational(n1, d1) == rat
          vals << rat
        elsif n2 == d1 && Rational(n1, d2) == rat
          vals << rat
        elsif n1 == d2 && Rational(n2, d1) == rat
          vals << rat
        elsif n1 == d1 && Rational(n2, d2) == rat
          vals << rat
        end
      end
    end
  end
end

p vals.collect.inject(&:*).denominator
