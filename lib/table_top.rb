class TableTop
  attr_reader :columns, :rows

  def initialize(width: 0, height: 0)
    @columns = 0...width
    @rows = 0...height
  end

  def within_boundaries?(x:, y:)
    @columns.cover?(x) && @rows.cover?(y)
  end
end
