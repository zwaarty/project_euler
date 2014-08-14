require 'prime'

count = 0
(1..1_000_000).each do |d|
  if d.prime?
    count += d - 1
  elsif d.even?
    1.step(d-1, 2) do |n|
      count += 1 if d.gcd(n) == 1
    end
  else
    (1..(d-1)).each do |n|
      count += 1 if d.gcd(n) == 1
    end
  end
  p d if d % 1_000 == 0
end

p count
