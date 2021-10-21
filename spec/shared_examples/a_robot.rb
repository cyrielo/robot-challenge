RSpec.shared_examples 'a Robot' do
  specify 'properties' do
    should respond_to(:table_top)
    should respond_to(:position)
  end

  specify 'methods' do
    should respond_to(:place).with(3).argument
    should respond_to(:report)
    should respond_to(:move)
    should respond_to(:left)
    should respond_to(:right)
  end

  context '#place' do
    it 'should prevents placing robot on table with invalid positioning' do
      subject.place(5, 5, 'west')
      expect(subject.position.coords.any?).to be_falsy
    end

    it 'should place robot with valid coordinates and cardinal direction' do
      subject.place(4, 2, 'north')
      expect(subject.position.cardinal_direction).to eql(:NORTH)
      expect(subject.position.x_coord).to eql(4)
      expect(subject.position.y_coord).to eql(2)
    end
  end

  context '#report' do
    it 'should report robot coordinates and cardinal point' do
      coords = [4, 2]
      cardinal = 'NORTH'
      subject.place(*coords, cardinal)
      expect(subject.report).to eql("#{coords.join(',')} #{cardinal}")
    end
  end

  context '#move' do
    it 'it should advance robot position at cardinal direction' do
      x = 0
      y = 0
      cardinal = :NORTH
      subject.place(x, y, cardinal)
      subject.move
      subject.move
      expect(subject.position.y_coord).to eql(y + 2)
      expect(subject.position.x_coord).to eql(x)
      expect(subject.position.cardinal_direction).to eql(cardinal)
    end

    it 'it should not advance robot position if beyond table-top boundary' do
      x = 0
      y = 0
      cardinal = 'west'
      subject.place(x, y, cardinal)
      subject.move
      subject.move
      expect(subject.position.y_coord).to eql(y)
      expect(subject.position.x_coord).to eql(x)
    end
  end

  context '#left' do
    it 'should rotate robot 90 degree left' do
      x = 0
      y = 0
      cardinal = 'east'
      subject.place(x, y, cardinal)
      subject.left
      expect(subject.position.cardinal_direction).to eql(:NORTH)
      expect(subject.position.y_coord).to eql(y)
      expect(subject.position.x_coord).to eql(x)
    end
  end

  context '#right' do
    it 'should rotate robot 90 degree right' do
      x = 0
      y = 0
      cardinal = 'east'
      subject.place(x, y, cardinal)
      subject.right
      expect(subject.position.cardinal_direction).to eql(:SOUTH)
      expect(subject.position.y_coord).to eql(y)
      expect(subject.position.x_coord).to eql(x)
    end
  end
end
