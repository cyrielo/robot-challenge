require_relative '../../app/helpers/validation_helper'

RSpec.describe 'ToyRobot::ValidationHelper#is_valid_cardinal?' do
  context 'when you pass a cardinal direction value' do
    it 'should return true or false if its a valid cardinal' do
      valid_cardinals = %w(north east west south)
      invalid_cardinal = %w(northwest eastern west-coast southeast)

      valid_cardinals.each do  |cardinal|
        valid1 = ToyRobot::ValidationHelper.is_valid_cardinal?(cardinal)
        expect(valid1).to eql(true)
      end

      invalid_cardinal.each do  |cardinal|
        valid2 = ToyRobot::ValidationHelper.is_valid_cardinal?(cardinal)
        expect(valid2).to eql(false)
      end

      valid = ToyRobot::ValidationHelper.is_valid_cardinal?(nil)
      expect(valid).to eql(false)
    end
  end
end

RSpec.describe 'ToyRobot::ValidationHelper#is_valid_command?' do
  context 'when you pass a command parameter' do
    it 'should return true or false if its a valid command' do
      valid_commands = %w(place move report left right)

      valid_commands.each do  |command|
        valid1 = ToyRobot::ValidationHelper.is_valid_command?(command)
        expect(valid1).to eql(true)
      end

      valid = ToyRobot::ValidationHelper.is_valid_command?('')
      expect(valid).to eql(false)

      valid2 = ToyRobot::ValidationHelper.is_valid_command?(nil)
      expect(valid2).to eql(false)

    end
  end
end

RSpec.describe 'ToyRobot::ValidationHelper#is_valid_integer?' do
  context 'when you pass a numeric string' do
    it 'should validate if string can be parse to a Integer' do
      invalid_numbers = %w(1 0 1.2 0 3 4 5)
      valid_numbers = %w(1 0 1 2 3 5 9)

      valid1 = ToyRobot::ValidationHelper.is_valid_integer?(*invalid_numbers)
      expect(valid1).to eql(false)

      valid2 = ToyRobot::ValidationHelper.is_valid_integer?(*valid_numbers)
      expect(valid2).to eql(true)

      valid = ToyRobot::ValidationHelper.is_valid_integer?(nil)
      expect(valid).to eql(false)
    end
  end
end

RSpec.describe 'ToyRobot::ValidationHelper#place' do
  context 'when execute a place command' do
    it 'should validate that #place is called with valid parameters ' do
      valid_place_params= '0,0,east'.scan(/-?\w+/)
      in_valid_place_param = '0,east'.scan(/-?\w+/)
      in_valid_place_param2 = '0,0,southern'.scan(/-?\w+/)

      #print 'valid_place_params', valid_place_params

      valid = ToyRobot::ValidationHelper.place(*valid_place_params)
      expect(valid).to eql(true)

      expect { ToyRobot::ValidationHelper.place(*in_valid_place_param)
      }.to raise_error(ArgumentError)

      valid = ToyRobot::ValidationHelper.place(*in_valid_place_param2)
      expect(valid).to eql(false)
    end
  end
end