require 'Calculator'

describe Calculator do
  context 'divide' do
    it 'divide by 0' do
      expect { subject.div(3, 0) }.to raise_exception # too generic, don't use
      expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError)
      expect { subject.div(3, 0) }.to raise_error('divided by 0')
      expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError, 'divided by 0')
      expect { subject.div(3, 0) }.to raise_error(/divided/)
    end
  end

  context '#sum' do
    it 'with positive numbers' do
      result = subject.sum(5, 7)

      expect(result).to eq(12)
      expect(result).not_to eq(1)
    end

    it 'with negative and positive numbers' do
      result = subject.sum(-5, -7)

      expect(result).to eq(-12)
    end

    it 'with negative numbers' do
      result = subject.sum(-5, 7)

      expect(result).to eq(2)
    end
  end
end