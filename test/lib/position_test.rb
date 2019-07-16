require 'test_helper'

class PositionTest < Minitest::Test
  def setup
    @instance = Position.new(x: 0, y: 0, direction: Position::DIRECTION[:north])
  end

  def test_initializes_with_x_y_and_direction_correctly
    assert_equal(0, @instance.x)
    assert_equal(0, @instance.y)
    assert_equal(Position::DIRECTION[:north], @instance.direction)
  end

  def test_able_to_move_left_to_change_direction
    expected = Position::DIRECTION[:west]
    result = @instance.left
    assert_equal(expected, result)
  end

  def test_able_to_move_right_to_change_direction
    expected = Position::DIRECTION[:east]
    result = @instance.right
    assert_equal(expected, result)
  end

  def test_able_to_move_back
  end

  def test_able_to_move_forward
  end
end
