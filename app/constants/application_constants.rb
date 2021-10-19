module ToyRobot
  VALID_COMMANDS = %w(PLACE MOVE REPORT LEFT RIGHT OBSTRUCT SPAWN).freeze
  CARDINALS = { south: :SOUTH, west: :WEST, north: :NORTH, east: :EAST }.freeze
end
