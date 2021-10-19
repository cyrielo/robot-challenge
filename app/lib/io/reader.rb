module ToyRobot
  class Reader
    attr_reader :lines

    def read_from_file(path)
      @lines = File.readlines(path, chomp: true) rescue false
      return self
    end

    def readline(prompt = nil, &command)
      return unless @lines
      @lines.each do |line|
        yield line.strip.chomp
      end
    end
  end
end

