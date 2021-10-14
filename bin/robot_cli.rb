#!/usr/bin/env ruby
require "readline"
require_relative '../app/application'

robot_app = ToyRobot::Application.new

begin
  print(robot_app.help_prompt)
  while command = Readline.readline("ToyRobot v1.0 > ")
    if command
      break if command.downcase == 'exit'
      print robot_app.help_prompt if command.downcase == 'help'
      robot_app.run(command)
    end
  end
rescue Interrupt
  exit
end

