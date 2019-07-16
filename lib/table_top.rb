class TableTop
  attr_reader :columns, :rows

  def initialize(width:, height:)
    @columns = 0...width
    @rows = 0...height
  end

  def within_boundaries?(x_coordinate:, y_coordinate:)
    @columns.cover?(x_coordinate) && @rows.cover?(y_coordinate)
  end
end
