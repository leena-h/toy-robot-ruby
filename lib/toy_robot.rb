class ToyRobot
  attr_reader :position, :table_top

  def initialize(position: Position.new, table_top: TableTop.new)
    @position = position
    @table_top = table_top
  end

  def move(x:, y:)
    @position.move if @table_top.within_boundaries?(x: x, y: y)
    @position.report
  end
end
