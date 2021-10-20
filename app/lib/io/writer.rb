module ToyRobot
  class Writer
    attr_reader :path

    def file(path)
      @path = path
      self
    end

    def write(data, suffix = '')
      if @path
        File.open(path, 'a+') { |f| f.write("#{data}#{suffix}") }
      else
        print("#{data}#{suffix}") if data.is_a?(String)
      end
    end

    def writeln(data)
      write(data, "\n")
    end
  end
end

