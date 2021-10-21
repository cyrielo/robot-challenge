require_relative '../application'

module ToyRobotV2
  class Application < ToyRobot::Application
    VERSION = 'ToyRobot v2.0'.freeze

    def initialize(robot: Robot)
      super(robot: robot)
    end

    def version
      VERSION
    end

    def help_prompt
      "USAGE:\n"\
      "--file [path] \t # use option to load commands from a file \n"\
      "--output [path]\t # use option to write robot output to a file \n"\
        "PLACE 0,0 WEST \t # places the robot south west \n"\
        "MOVE \t\t # moves robot one step forward at current cardinal \n"\
        "LEFT \t\t # rotates robot 90 degrees left\n"\
        "RIGHT \t\t # rotates robot 90 degrees right \n"\
        "REPORT \t\t # announces  X,Y and cardinal of the robot \n"\
        "SPAWN \t\t # place robot at random coordinate \n"\
        "OBSTRUCT \t # prevent robot from moving forward\n"\
        "HELP \t\t # shows this prompt\n"\
        "EXIT \t\t # exits program \n"
    end
  end
end
