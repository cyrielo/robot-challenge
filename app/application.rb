require_relative 'helpers/application_helper'
require_relative 'helpers/validation_helper'
require_relative 'lib/table_top'
require_relative 'lib/robot'
require_relative 'lib/robot_position'

module ToyRobot
  class Application
    attr_accessor :command, :args

    def initialize
      @tableTop = TableTop.new
      @toy_robot = Robot.new(@tableTop)
    end

    def run(command)
      parse_command(command)
      if is_valid_command?
        output = @toy_robot.send(@command, *@args) rescue false
        print("#{output}\n") if output.is_a?(String)
      end
    end

    def help_prompt
      "USAGE:\n"\
        "PLACE 0,0 WEST \t # places the robot south west \n"\
        "MOVE \t\t # moves robot one step forward at current cardinal \n"\
        "LEFT \t\t # rotates robot 90 degrees left\n"\
        "RIGHT \t\t # rotates robot 90 degrees right \n"\
        "REPORT \t\t # announces  X,Y and cardinal of the robot \n"\
        "HELP \t\t # shows this prompt\n"\
        "EXIT \t\t # exits program \n"
    end

    private
    def parse_command(command)
      parsed_command = ApplicationHelper::parse_command(command)
      @command = parsed_command[:command]
      @args = parsed_command[:args]
    end

    def is_valid_command?
      ValidationHelper::is_valid_command?(@command) && is_valid_params
    end

    def is_valid_params
      return false unless @command
      method = @command.downcase.to_sym
      is_valid = true
      if ValidationHelper.respond_to?(method)
        is_valid = ValidationHelper.send(method, *@args) rescue false
      end
      is_valid
    end
  end
end
