require 'student'
require 'course'

describe "Mocks" do
  it '#bar' do
    student = Student.new

    expect(student).to receive(:bar)
    student.bar
  end

  it 'parametros' do
    student = Student.new
    expect(student).to receive(:foo).with(123)
    student.foo(123)
  end

  it 'repetição' do
    student = Student.new
    expect(student).to receive(:foo).with(123).twice
    student.foo(123)
    student.foo(123)
  end

  it 'retorno' do
    student = Student.new
    expect(student).to receive(:foo).with(123).and_return(true)
    puts student.foo(123)
  end
end
