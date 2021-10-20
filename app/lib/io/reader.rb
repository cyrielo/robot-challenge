require "readline"
module ToyRobot
  class Reader
    attr_reader :lines

    def file(path)
      @lines = File.readlines(path, chomp: true) rescue nil
      self if @lines
    end

    def readline(prompt = '', &command)
      if @lines.nil?
        while line = Readline.readline(prompt)
          yield line.strip.chomp 
        end
      else
        @lines.each do |line|
          yield line.strip.chomp
        end        
      end
    end
  end
end

