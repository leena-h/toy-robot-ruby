require 'test_helper'

class PositionTest < Minitest::Test
  def setup
    @instance = Position.new(x: 0, y: 0, direction: :north)
  end

  def test_initializes_with_x_y_and_direction_correctly
    assert_equal(0, @instance.x)
    assert_equal(0, @instance.y)
    assert_equal(:north, @instance.direction)
  end

  def test_able_to_move_left
  end

  def test_able_to_move_right
  end

  def test_able_to_move_back
  end

  def test_able_to_move_forward
  end
end
