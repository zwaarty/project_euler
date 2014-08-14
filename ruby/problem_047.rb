require 'prime'

puts (1..Float::INFINITY).each_cons(4).detect { |quartet|
  quartet.collect { |e| e.prime_division }.all? { |divs| divs.length == 4 }
}.first

