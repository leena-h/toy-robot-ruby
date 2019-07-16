require 'test_helper'

class TableTopTest < Minitest::Test
  def setup
    @instance = TableTop.new(width: 5, height: 5)
  end

  def test_initialize_with_width_and_height
    expected_rows = 0...5
    expected_columns = 0...5
    assert_equal(expected_rows, @instance.rows)
    assert_equal(expected_columns, @instance.columns)
  end

  def test_determines_within_bounds_correctly
    refute @instance.within_boundaries?(x: 6, y: 6)
  end
end
