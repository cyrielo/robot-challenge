#!/usr/bin/env ruby
require_relative '../app/lib/cli.rb'
require_relative '../app/factory/toy_robot'

application = ToyRobot::Factory.create_application_v2

ToyRobot::Cli.new(application: application)

