module ToyRobot
  class ApplicationHelper
    def self.parse_command(command)
      return {} unless command.is_a?(String)
      command = command.scan(/-?\w+/)
      action = command.first
      args = command[1...]
      { args: args, command: action }
    end
  end
end
