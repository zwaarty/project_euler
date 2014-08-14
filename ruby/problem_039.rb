class Array
  def right_angle_triangle?
    arr = self.sort
    arr[0] ** 2 + arr[1] ** 2 == arr [2] ** 2
  end
end

class Integer
  def generate_triangle
    (1..(self / 3)).each do |short|
      (short..((self - short) / 2)).each do |mid|
        long = self - short - mid
        yield [short, mid, long]
      end
    end
  end
end

score = {}
(3..1000).each do |perimeter|
  count = 0
  perimeter.generate_triangle do |tri|
    count += 1 if tri.right_angle_triangle?
  end
  score[perimeter] = count
end

maxp = score.max_by { |k, v| v }
puts maxp, score[maxp]
