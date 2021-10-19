module ToyRobot
  class Writer
    attr_reader :format, :path

    def write_to_file(path)
      @path = path
    end

    def output_format(out_format)
      @format = out_format
    end

    def write(data)
      print("#{data} \n") if data.is_a?(String)
    end
  end
end

