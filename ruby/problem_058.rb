require 'fiber'
require 'prime'

def seq_gen
  Fiber.new do
    k = 1
    t = 1
    Fiber.yield t
    loop do
      k += 1
      d = 2 * (k - 1)
      4.times do |i|
        t += d
        Fiber.yield t
      end
    end
  end
end

gen = seq_gen
side_length = 1
gen.resume
num_all = 1
num_prime = 0

loop do
  side_length += 2
  4.times do
    num = gen.resume
    num_all += 1
    num_prime += 1 if num.prime?
  end
  ratio = num_prime / num_all.to_f
  break if ratio < 0.1
end

p side_length
