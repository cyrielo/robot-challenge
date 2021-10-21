#!/usr/bin/env ruby
require_relative '../app/lib/cli.rb'
require_relative '../app/factory/robot_factory'

application = ToyRobot::Factory.create_application_v2
reader = ToyRobot::Factory.create_reader
writer = ToyRobot::Factory.create_writer

writer.writeln(application.help_prompt)
ToyRobot::Cli.new(app: application, reader: reader, writer: writer)

