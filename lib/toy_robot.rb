class ToyRobot
  attr_reader :table_top

  def initialize(table_top: TableTop.new, position: Position.new)
    @position = position
    @table_top = table_top
  end

  def left
    @position.left
    report
  end

  def right
    @position.right
    report
  end

  def move
    old_position = report
    new_position = @position.move
    @position =
      if table_top.within_boundaries?(x: new_position.x, y: new_position.y)
        new_position
      else
        old_position
      end
    report
  end

  def report
    @position.report
  end
end
