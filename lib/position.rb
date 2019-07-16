class Position
  attr_reader :x_coordinate, :y_coordinate, :direction

  DIRECTION = {
    north: 0,
    east: 1,
    west: 2,
    south: 3
  }.freeze

  def initialize(x_coordinate:, y_coordinate:, direction: DIRECTION[:north])
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def left
    @direction =
      unless @direction == DIRECTION[:north]
        @direction += 1
      else
        DIRECTION[:west]
      end
  end

  def right
    @direction =
      unless @direction == DIRECTION[:west]
        @direction += 1
      else
        DIRECTION[:north]
      end
  end

  def move
    case @direction
    when DIRECTION[:north]
      @y_coordinate += 1
    when DIRECTION[:east]
      @x_coordinate += 1
    when DIRECTION[:south]
      @y_coordinate -= 1
    when DIRECTION[:west]
      @x_coordinate -= 1
    end
  end

  def report
    Position.new(
      x_coordinate: @x_coordinate,
      y_coordinate: @y_coordinate,
      direction: @direction
    )
  end
end
