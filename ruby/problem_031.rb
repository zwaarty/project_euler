# Coin sums
# Problem 31

seq = []

rest0 = 200
(0..rest0/200).each do |p200|
  rest1 = rest0 - p200 * 200
  break if rest1 < 0
  (0..rest1/100).each do |p100|
    rest2 = rest1 - p100 * 100
    break if rest2 < 0
    (0..rest2/50).each do |p50|
      rest3 = rest2 - p50 * 50
      break if rest3 < 0
      (0..rest3/20).each do |p20|
        rest4 = rest3 - p20 * 20
        break if rest4 < 0
        (0..rest4/10).each do |p10|
          rest5 = rest4 - p10 * 10
          break if rest5 < 0
          (0..rest5/5).each do |p5|
            rest6 = rest5 - p5 * 5
            break if rest6 < 0
            (0..rest6/2).each do |p2|
              rest7 = rest6 - p2 * 2
              break if rest7 < 0
              p1 = rest7
              seq << [p1, p2, p5, p10, p20, p50, p100, p200]
            end
          end
        end
      end
    end
  end
end

# p seq
p seq.length
