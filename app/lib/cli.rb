require_relative 'io/reader'
require_relative 'io/writer'

module ToyRobot
  class Cli
    attr_reader :application, :options, :reader, :writer

    def initialize(app: Application, reader: Reader, writer: Writer)
      @application = app
      @options = parse_options
      @reader = reader
      @writer = writer
      use_options
    end

    def start
      if @reader.nil? || @writer.nil?
        raise IOError.new('Reader or Writer Streams not provided')
      end
      begin
        @reader.readline(prompt) do |command|
          command = command.strip.downcase.chomp
          case command
          when 'exit'
          break
          when 'help'
            @writer.writeln(@application.help_prompt)
          else
            response = @application.run(command)
            @writer.writeln(response) if response
          end
        end
        rescue Interrupt
        return
        rescue
      end
    end

    def prompt
      "#{@application.version} >"
    end

    def use_options
      @reader = @reader.file(@options[:file]) if @options.has_key?(:file)
      @writer = @writer.file(@options[:output]) if @options.has_key?(:output)
    end

    private
    def parse_options
      return {} if ARGV.empty?
      options = ARGV.each_slice(2).filter { |i| i.length == 2 }.flatten
      options = Hash[*options].transform_keys { |k| k.gsub(/-/, '').to_sym }
      options = options.filter { |op| permitted_options.has_key?(op) }
    end

    def permitted_options
      { file: true, output: true, format: true }.freeze
    end
  end
end

