# Pandigital products
# Problem 32

class Array
  def split_to_identity m, n
    t1 = self[0..m]
    t2 = self[(m+1)..n]
    t3 = self[(n+1)..8]
    [t1, t2, t3]
  end

  def to_integer
    collect(&:to_s).join.to_i
  end

  def pandigital?
    t1 = self[0].to_integer
    t2 = self[1].to_integer
    t3 = self[2].to_integer
    t1 * t2  == t3
  end

  def generate_identities
    idens = []
    (0..3).each do |m|
      ((m+1)..4).each do |n|
        idens << split_to_identity(m, n)
      end
    end
    idens
  end
end

p [*1..9].permutation.collect(&:generate_identities).flatten(1).select(&:pandigital?).collect { |arr|
  arr[2].to_integer
}.uniq.inject(&:+)

