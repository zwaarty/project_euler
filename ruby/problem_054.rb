
class PokerHand
  def initialize hand
    @cards = my_cards hand
    @rank, @highest = decipher
  end
  attr_reader :cards, :rank, :highest

  def win? other
    if self.rank > other.rank
      true
    elsif self.rank == other.rank
      self.highest > other.highest
    else
      false
    end
  end

  private

  def decipher
    if a = royal_flush?
      [10, a]
    elsif b = straight_flush?
      [9, b]
    elsif c = four_of_a_kind?
      [8, c]
    elsif d = full_house?
      [7, d]
    elsif e = flush?
      [6, e]
    elsif f = straight?
      [5, f]
    elsif g = three_of_a_kind?
      [4, g]
    elsif h = two_pairs?
      [3, h]
    elsif i = one_pair?
      [2, i]
    else
      [1, highest_num]
    end
  end

  def to_num c
    case c.upcase
    when 'T'
      10
    when 'J'
      11
    when 'Q'
      12
    when 'K'
      13
    when 'A'
      14
    else
      c.to_i
    end
  end

  def my_cards hand
    hand.collect do |nm|
      n_and_m = nm.chars
      [to_num(n_and_m[0]), n_and_m[1]]
    end
  end

  def marks
    cards.collect { |c| c.last }
  end

  def nums
    cards.collect { |c| c.first }
  end

  def highest_num
    nums.max
  end

  def royal_flush?
    royal? and flush? ? highest_num : false
  end

  def straight_flush?
    straight? and flush? ? highest_num : false
  end

  def royal?
    nums == [*10..14]
  end

  def straight?
    nums.sort.each_cons(2) { |i, j| return false until (j - i) == 1 }
    nums.last
  end

  def flush?
    marks.uniq.length == 1 ? highest_num : false
  end

  def four_of_a_kind?
    maxnum = nums.group_by { |e| e }.max { |a, b| a[1].length <=> b[1].length }
    maxnum.last.length == 4 ? maxnum.first : false
  end

  def three_of_a_kind?
    maxnum = nums.group_by { |e| e }.max { |a, b| a[1].length <=> b[1].length }
    maxnum.last.length == 3 ? maxnum.first : false
  end

  def two_pairs?
    pairs = nums.group_by { |e| e }.select { |k, v| v.length == 2}
    pairs.length == 2 ? pairs.max[0] : false
  end

  def one_pair?
    pairs = nums.group_by { |e| e }.select { |k, v| v.length == 2}
    pairs.length == 1 ? pairs.max[0] : false
  end

  def full_house?
    a = three_of_a_kind?
    b = one_pair?
    a and b ? a : false
  end
end

win_count = 0
open('poker.txt') do |f|
  while line = f.gets
    arr = line.split
    player1, player2 = PokerHand.new(arr[0..4]), PokerHand.new(arr[5..9])
    win_count += 1 if player1.win?(player2)

    puts "#{player1.cards}, #{player1.rank}, #{player1.highest}"
    puts "#{player2.cards}, #{player2.rank}, #{player2.highest}"
    puts player1.win?(player2)
  end
end

p win_count
