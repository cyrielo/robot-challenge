#!/usr/bin/env ruby
require_relative '../app/factory/robot_factory'

application = ToyRobot::Factory.create_application
cli_app = ToyRobot::Factory.create_cli(app: application)
print application.help_prompt
cli_app.start
