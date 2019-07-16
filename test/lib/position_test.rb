require 'test_helper'

class PositionTest < Minitest::Test
  def setup
    @instance = Position.new(
      x_coordinate: 0,
      y_coordinate: 0,
      direction: Position::DIRECTION[:north]
    )
  end

  def test_initializes_with_x_y_and_direction_correctly
    assert_equal(0, @instance.x_coordinate)
    assert_equal(0, @instance.y_coordinate)
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

  def test_able_to_move_correctly
    @instance.move  # Move up north 1 (x: 0, y: 1)
    @instance.move  # Move up north 1 (x: 0, y: 2)
    @instance.right # Face east
    @instance.move  # Move right (x: 1, y: 2)
    @instance.move  # Move right (x: 2, y: 2)

    expected = Position.new(
      x_coordinate: 2,
      y_coordinate: 2,
      direction: Position::DIRECTION[:east]
    )
    result = @instance.report
    assert_equal(expected.x_coordinate, result.x_coordinate)
    assert_equal(expected.y_coordinate, result.y_coordinate)
    assert_equal(expected.direction, result.direction)
  end
end
