require 'prime'
require 'msgpack'
require 'lzma'

def prime_pair? p1, p2
  pair = [p1, p2]
  pair.join.to_i.prime? and pair.reverse.join.to_i.prime?
end

primes = MessagePack.unpack(LZMA.decompress(File.read('prime.dump'))).first(3_000)
len = primes.length

candidates = []
( 0..(len-5) ).each do |i|
  p1 = primes[i]
  ( (i+1)..(len-4) ).each do |j|
    p2 = primes[j]
    if prime_pair?(p1, p2)
      ( (j+1)..(len-3) ).each do |k|
        p3 = primes[k]
        if [p1, p2].all? { |pr| prime_pair?(pr, p3) }
          ( (k+1)..(len-2) ).each do |m|
            p4 = primes[m]
            if [p1, p2, p3].all? { |pr| prime_pair?(pr, p4) }
              puts "#{p1}, #{p2}, #{p3}, #{p4}"
              ( (m+1)..(len-1) ).each do |n|
                p5 = primes[n]
                if [p1, p2, p3, p4].all? { |pr| prime_pair?(pr, p5) }
                  cand = [p1, p2, p3, p4, p5]
                  candidates << cand
                  p cand
                end
              end
            end
          end
        end
      end
    end
  end
end

p candidates.collect{ |ary| ary.inject(:+) }.min
