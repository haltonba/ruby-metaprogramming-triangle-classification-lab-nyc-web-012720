class Triangle
  
  attr_accessor :side1, :side2, :side3

  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def is_triangle?
    if side1 == 0 || side2 == 0 || side3 == 0
      return false
    end
    sorted = [side1, side2, side3].sort
    longest_side = sorted.pop
    longest_side < sorted.sum
  end

  def kind
    if !is_triangle?
      raise TriangleError
    elsif [side1, side2, side3].uniq.length == 1
      :equilateral
    elsif [side1, side2, side3].uniq.length == 3
      :scalene
    else [side1, side2, side3].uniq.length == 2
      :isosceles
    end
  end

  class TriangleError < StandardError
  end
end
