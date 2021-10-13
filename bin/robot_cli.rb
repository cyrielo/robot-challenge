#!/usr/bin/env ruby
require "readline"
begin
  while buf = Readline.readline("robot 1.0 > ")
    print("-> ", buf, "\n")
  end
rescue Interrupt
  exit
end


