require 'readline'
module ToyRobot
  class Reader
    attr_reader :lines

    def file(path)
      @lines = begin
        File.readlines(path, chomp: true)
      rescue StandardError
        nil
      end
      self if @lines
    end

    def readline(prompt = '')
      if @lines.nil?
        while (line = Readline.readline(prompt))
          yield line.strip.chomp
        end
      else
        @lines.each do |command|
          yield command.strip.chomp
        end
      end
    end
  end
end
