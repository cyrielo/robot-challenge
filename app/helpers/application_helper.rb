module ToyRobot
  class ApplicationHelper
    def self.parse_commands(command)
      command = command.scan(/-?\w+/)
      action = command.first.upcase if command.first
      args = command[1...]
      { args: args, command: action }
    end
  end
end
