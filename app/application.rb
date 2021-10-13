require 'lib/table_top'
require 'lib/robot'

=begin
todo: implement robust validations
validate cardinal arguments
=end
module ToyRobot
  class Application
    attr_accessor :command

    def initialize
      @tableTop = TableTop.new
      @toy_robot = Robot.new(@tableTop)
    end

    def run(command)
      parse_commands(command)
      if is_valid_command?
        @toy_robot.send(@command, *@args)
      end
      #command.clear
    end

    private
      def parse_commands(command)
        command = command.scan(/-?\w+/)
        @command = command.first.downcase.to_sym if command.first
        @args = command[1...]
      end

      def permit_commands

      end
      def is_valid_command?
        true
      end
  end
end
