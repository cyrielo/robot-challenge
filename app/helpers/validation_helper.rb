require_relative '../constants/application_constants'
module ToyRobot
  class ValidationHelper
    def self.is_valid_cardinal?(cardinal)
      cardinal = cardinal.downcase.to_sym if cardinal.is_a?(String)
      CARDINALS.has_key?(cardinal)
    end

    def self.is_valid_command?(command)
      command = command.upcase if command.is_a?(String)
      VALID_COMMANDS.include?(command)
    end

    def self.is_valid_integer?(*nums)
      return false if nums.nil?
      nums.each { |num| Integer(num) rescue return false }.any?
    end

    def self.place(x_coord, y_coord, cardinal)
      is_valid_integer?(x_coord, y_coord) && is_valid_cardinal?(cardinal)
    end
  end
end
