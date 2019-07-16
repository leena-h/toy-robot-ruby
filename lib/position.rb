class Position
  attr_reader :x, :y, :direction
  # VALID_DIRECTIONS = [:north, :east, :west, :south]

  def initialize(x:, y:, direction: :north)
    @x = x
    @y = y
    @direction = direction
  end
end
