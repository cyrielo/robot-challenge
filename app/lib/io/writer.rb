module ToyRobot
  class Writer
    attr_reader :path, :format

    def file(path)
      @path = path
      self
    end

    def write(data, suffix_string = nil)
      data = format_output(data)
      if @path
        File.open(path, 'a+') { |f|
          f.write(data)
          f.write(suffix_string) if suffix_string
        }
      else
        print(data) if data.is_a?(String)
        print(suffix_string) if suffix_string
      end
    end

    def writeln(data)
      write(data, "\n")
    end

    private
    def format_output(data)
      return data.to_s if @format.nil?
    end
  end
end

