require 'pry'
require_relative 'lib/position'
require_relative 'lib/table_top'
require_relative 'lib/toy_robot'

class Cli
  def initialize
    @table_top = TableTop.new(width: 5, height: 5)
    @toy_robot
  end

  def run
    puts "Type 'EXIT' to quit"
    loop do
      input = gets.chomp
      command = formatted_command(input)
      case command
      when 'PLACE'
        place_command(input)
      when 'LEFT'
        left_command(input)
      when 'RIGHT'
        right_command(input)
      when 'MOVE'
        move_command(input)
      when 'REPORT'
        report_command(input)
      when 'EXIT'
        break
      end
    end
  end

  private

  def formatted_command(cmd)
    cmd.split(' ')[0].upcase
  end

  def place_command(input)
    inputs = input.split(/[\s,]+/)
    if is_place_command_valid?(inputs)
      x_coordinate = inputs[1].to_i
      y_coordinate = inputs[2].to_i
      direction = inputs[3].downcase.to_sym
      position =
        Position.new(
          x: x_coordinate,
          y: y_coordinate,
          direction: Position::DIRECTION[direction])
      @toy_robot =
        ToyRobot.new(
          table_top: @table_top,
          position: position)
    end
  end

  def left_command(input)
    return if @toy_robot.nil?
    @toy_robot.left
  end

  def right_command(input)
    return if @toy_robot.nil?
    @toy_robot.right
  end

  def move_command(input)
    return if @toy_robot.nil?
    @toy_robot.move
  end

  def report_command(input)
    return if @toy_robot.nil?
    result = @toy_robot.report
    direction = Position::DIRECTION.key(result.direction)
    puts [result.x, result.y, direction.upcase].join(',')
  end

  def is_place_command_valid?(inputs)
    inputs.size == 4 && # Provided 4 arguments
    !(Position::DIRECTION[inputs[3]&.downcase&.to_sym].nil?) # Provided valid direction
  end
end

Cli.new.run
