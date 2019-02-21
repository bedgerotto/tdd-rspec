require 'student'
require 'course'

describe "Mocks" do
  it '#bar' do
    student = Student.new

    expect(student).to receive(:bar)
    student.bar
  end
end
