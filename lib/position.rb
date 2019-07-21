class Position
  attr_reader :x, :y, :direction

  DIRECTION = {
    north: 0,
    east: 1,
    south: 2,
    west: 3
  }.freeze

  def initialize(x: 0, y: 0, direction: DIRECTION[:north])
    @x = x
    @y = y
    @direction = direction
  end

  def left
    @direction =
      if @direction != DIRECTION[:north]
        @direction -= 1
      else
        DIRECTION[:west]
      end
    report
  end

  def right
    @direction =
      if @direction < DIRECTION[:west]
        @direction += 1
      else
        DIRECTION[:north]
      end
    report
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
    report
  end

  def report
    Position.new(x: @x, y: @y, direction: @direction)
  end
end
