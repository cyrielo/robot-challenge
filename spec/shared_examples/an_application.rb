RSpec.shared_examples 'an Application' do
  def valid_commands
    commands = ['PLACE 0,0, EAST', 'place 1,3,west', 'pLace 2,4,noRtH']
    response = ['0,0 EAST', '1,3 WEST', '2,4 NORTH']
    { commands: commands, response: response }
  end
  specify 'properties' do
    should respond_to(:args)
    should respond_to(:command)
    should respond_to(:toy_robot)
  end

  specify '#version' do
    should respond_to(:version)
    expect(subject.version).to be_a String
    expect(subject.version.frozen?).to be true
  end

  specify '#help_prompt' do
    should respond_to(:help_prompt)
  end

  specify '#run' do
    should respond_to(:run).with(1).argument
    commands = valid_commands[:commands]
    response = valid_commands[:response]
    commands.each_with_index do |command, idx|
      subject.run(command)
      report = subject.run('report')
      expect(report).to eql(response[idx])
    end
    subject.run('asdf')
    report = subject.run('report')
    expect(report).to eql(response.last)
  end
end
