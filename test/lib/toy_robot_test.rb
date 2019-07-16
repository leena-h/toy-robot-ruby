require 'test_helper'

class ToyRobotTest < Minitest::Test
  def setup
    @instance = ToyRobot.new
  end

  def test_initialize_toy_robot_successfully
    assert @instance.respond_to?(:table_top)
    assert @instance.respond_to?(:position)
  end

  def test_must_not_fall_off_table_if_illegal_move
    result = @instance.move(x: 1, y: 1)

  end
end
