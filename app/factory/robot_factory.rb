require_relative '../lib/robot'
require_relative '../v2.0/lib/robot'
require_relative '../lib/position'
require_relative '../lib/table_top'
require_relative '../v2.0/lib/obstacle'
require_relative '../application'
require_relative '../v2.0/application'
require_relative '../lib/io/reader'
require_relative '../lib/io/writer'
require_relative '../lib/cli'

module ToyRobot
  class Factory

    def self.create_robot
      table_top = create_tabletop
      position = create_position
      ToyRobot::Robot.new(table_top: table_top, position: position)
    end

    def self.create_robotv2
      table_top = create_tabletop
      position = create_position
      obstacle = create_obstacle
      ToyRobotV2::Robot.new(table_top: table_top, position: position, obstacle: obstacle)
    end

    def self.create_obstacle
      ToyRobotV2::Obstacle.new
    end

    def self.create_tabletop(length = 5, height = 5)
      ToyRobot::TableTop.new(length, height)
    end

    def self.create_position(x_coord = nil, y_coord = nil, cardinal = nil)
      ToyRobot::Position.new(x_coord, y_coord, cardinal)
    end

    def self.create_application
      robot = create_robot
      ToyRobot::Application.new(robot: robot)
    end

    def self.create_application_v2
      robot = create_robotv2
      ToyRobotV2::Application.new(robot: robot)
    end

    def self.create_writer
      ToyRobot::Writer.new
    end

    def self.create_reader
      ToyRobot::Reader.new
    end

    def self.create_cli(app: Application, reader: Reader, writer: Writer)
      app = create_application unless app.is_a?(ToyRobot::Application)
      reader = create_reader unless reader.instance_of?(ToyRobot::Reader)
      writer = create_writer unless writer.instance_of?(ToyRobot::Writer)
      ToyRobot::Cli.new(app: app, reader: reader, writer: writer)
    end
  end
end
