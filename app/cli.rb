require "readline"
require_relative '../app/lib/io/reader'
require_relative '../app/lib/io/writer'

module ToyRobot
  class Cli
    attr_reader :reader, :writer

    def initialize(application: ToyRobot::Application)
      @application = application
      @options = parse_options
      start
    end

    def start
      use_options
      handle_read
    end

    def handle_read
      @reader = read_from_command_line if @reader.nil?

      begin
        while command = @reader.readline(prompt)
          command = command.strip.downcase.chomp
          case command
          when 'exit'
          break
          when 'help'
            handle_write(@application.help_prompt)
          else
            response = @application.run(command)
            handle_write(response)
          end
        end
        rescue Interrupt
        exit
        rescue
      end
    end

    def prompt
      "#{@application.version} >"
    end

    def handle_write(data)
      output_format = @options[:format]
      @writer = Writer.new if @writer.nil?
      writer.output_format(output_format) if output_format

      @writer.write(data) if data
    end

    def use_options
      @options.each do |option, _|
        case option
        when :file
          read_from_file(@options[:file])
        when :url
          read_from_url(@options[:url])
        when :output
          write_to_file(@options[:output])
        else
          # type code here
        end
      end
    end

    private
    def read_from_command_line
      handle_write(@application.help_prompt)
      Readline
    end

    def read_from_file(path)
      reader = Reader.new
      @reader = reader.read_from_file(path)
    end

    def read_from_url(path)
      reader = Reader.new
      @reader = reader.read_from_url(path)
    end

    def write_to_file(path)
      writer = Writer.new
      @writer = writer.write_to_file(path)
    end

    def parse_options
      return {} if ARGV.empty?
      options = ARGV.each_slice(2).filter { |i| i.length == 2 }.flatten
      Hash[*options].filter { |op| permitted_options.has_key?(op) }
    end

    def permitted_options
      { file: true, output: true, url: true, format: true }.freeze
    end
  end
end

