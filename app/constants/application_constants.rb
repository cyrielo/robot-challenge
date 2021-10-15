module ToyRobot
  VERSION = "1.0".freeze
  VALID_COMMANDS = %w(PLACE MOVE REPORT LEFT RIGHT).freeze
  CARDINALS = { south: :SOUTH, west: :WEST, north: :NORTH, east: :EAST }.freeze
end
