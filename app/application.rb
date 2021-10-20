require_relative 'constants/application_constants'

module ToyRobot
  class Application
    attr_accessor :command, :args

    VERSION = "ToyRobot v1.0".freeze

    def initialize(robot: Robot)
      @toy_robot = robot
    end

    def run(command)
      parse_command(command)
      if is_valid_command?
        output = @toy_robot.send(@command, *@args) rescue false
      end
      output
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

    def version
      VERSION
    end

    protected
    def parse_command(command)
      return {} unless command.is_a?(String)
      command = command.scan(/-?\w+/)
      @command = command.first.downcase if command.first
      @args = command[1...]
    end

    def is_valid_command?
      command = @command.upcase if @command.is_a?(String)
      VALID_COMMANDS.include?(command)
    end
  end
end
