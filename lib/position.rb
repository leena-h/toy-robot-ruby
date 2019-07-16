class Position
  attr_reader :x, :y, :direction

  DIRECTION = {
    north: 0,
    east: 1,
    west: 2,
    south: 3
  }.freeze

  def initialize(x:, y:, direction: DIRECTION[:north])
    @x = x
    @y = y
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
      @y += 1
    when DIRECTION[:east]
      @x += 1
    when DIRECTION[:south]
      @y -= 1
    when DIRECTION[:west]
      @x -= 1
    end
  end

  def report
    Position.new(x: @x, y: @y, direction: @direction)
  end
end
