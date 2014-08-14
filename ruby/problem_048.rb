puts (1..1000).collect { |n| n ** n }.inject(:+).to_s[-10..-1]
