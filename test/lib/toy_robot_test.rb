require 'test_helper'

class ToyRobotTest < Minitest::Test
  def test_initialize_toy_robot_successfully
    toy_robot = ToyRobot.new
    assert toy_robot.respond_to?(:table_top)
  end

  def test_must_not_fall_off_table_if_illegal_move
    toy_robot = ToyRobot.new
    result = toy_robot.move
    assert_equal(0, result.x)
    assert_equal(0, result.y)
    assert_equal(Position::DIRECTION[:north], result.direction)
  end

  def test_move_successfully_if_legal_move
    valid_table_top = TableTop.new(width: 5, height: 5)
    valid_position = Position.new(x: 4, y: 4, direction: Position::DIRECTION[:south])
    toy_robot = ToyRobot.new(position: valid_position, table_top: valid_table_top)

    result = toy_robot.move
    assert_equal(4, result.x)
    assert_equal(3, result.y)
    assert_equal(Position::DIRECTION[:south], result.direction)
  end
end
