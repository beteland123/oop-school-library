require 'spec_helper'
describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Math 101')
  end

  describe '#new' do
    it 'takes one parameters and returns a classrom object' do
      @classroom.should be_an_instance_of Classroom
    end
  end
  describe '#label' do
    it 'returns the correct label' do
      @classroom.label.should eql 'Math 101'
    end
  end
  describe '#add_student' do
    it 'sets the classroom on the student' do
      student = double('student')
      allow(student).to receive(:classroom=)

      @classroom.add_student(student)

      expect(student).to have_received(:classroom=).with(@classroom)
    end
  end
end
