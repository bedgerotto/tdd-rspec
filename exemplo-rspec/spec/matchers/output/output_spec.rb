describe 'Matcher output' do
  it { expect{ puts 'Bruno' }.to output.to_stdout }
  it { expect{ puts 'Bruno' }.to output("Bruno\n").to_stdout }
  it { expect{ puts 'Bruno' }.to output(/Bruno/).to_stdout }

  it { expect{ warn 'Bruno' }.to output.to_stderr }
  it { expect{ warn 'Bruno' }.to output("Bruno\n").to_stderr }
  it { expect{ warn 'Bruno' }.to output(/Bruno/).to_stderr }
end
