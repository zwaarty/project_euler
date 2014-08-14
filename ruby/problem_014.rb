# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.


class Colatz
  @cache = {1 => 1, 2 => 2}

  def self.next_num n
    if n.even? then (n / 2) else (3 * n + 1) end
  end

  def self.distance n
    @cache[n] ||= distance(next_num(n)) + 1
  end

  def self.seq n
    Array.new(n) { |i| distance (i + 1) }
  end
end

colatz_seq = Colatz.seq(1_000_000)
max_colatz = colatz_seq.max
max_index =  colatz_seq.rindex(max_colatz) + 1
puts "ans = #{max_index}, colatz = #{max_colatz}"
