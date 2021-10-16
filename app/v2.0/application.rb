require_relative '../application'
module ToyRobotV2
  class Application < ToyRobot::Application
    def help_prompt
      print "I am a different prompt\n"
    end
  end
end
