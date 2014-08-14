require 'prime'
require 'set'

# 置換する桁が２つの場合は10^9くらいまで探索したが解なし。
# 置換する桁は3つと仮定。
class Integer
  def generate_pattern
    maxnum = self.to_s.chars.group_by { |e| e }.max { |a, b| a[1].length <=> b[1].length }
    return nil unless maxnum.last.length >= 3

    chrs = self.to_s.chars
    len = chrs.length
    family = Set.new
    (0..(len-3)).each do |i|
      ((i+1)..(len-2)).each do |j|
        if chrs[i] == chrs[j]
          ((j+1)..(len-1)).each do |k|
            if chrs[k] == chrs[j]
              name = chrs.dup
              name[i] = name[j] = name[k] = '*'
              family << name.join
            end
          end
        end
      end
    end
    (arr = family.to_a).empty? ? nil : arr
  end
end

class String
  def generate_primes
    ('0'..'9').collect { |n| self.gsub(/\*/, n).to_i }.select(&:prime?)
  end

  def max_num
    self.gsub(/\*/, '9').to_i
  end
end

families = {}
count = 0
ans_family = nil

Prime.each.detect do |pr|
  count += 1

  if patterns = pr.generate_pattern
    patterns.each do |fm|
      if families[fm]
        families[fm] += 1
        if families[fm] == 8
          ans_family = fm
        end
      else
        families[fm] = 1
      end
    end
  end

  if count % 100000 == 0
    families.delete_if { |k, v| k.max_num < pr }
    p pr
  end

  ans_family
end

p ans_family.generate_primes
