require_relative '../application'
require_relative '../../app/lib/table_top'
module ToyRobotV2
  class Application < ToyRobot::Application

    def initialize
      super
    end

    def help_prompt
      print "I am a different prompt\n"
    end
  end
end
