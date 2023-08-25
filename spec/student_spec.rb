require 'spec_helper'

RSpec.describe Student do
  let(:classroom) { double('Classroom') }
  let(:student) { Student.new(classroom, 18) }

  describe '#play_hooky' do
    it 'returns a string representing playing hooky' do
      expect(student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end

  describe '#classroom=' do
    it 'assigns the classroom and adds the student to the classroom' do
      # Stub `student` method to return an empty array
      expect(classroom).to receive(:student).and_return([])
      # Expect `student` method to be called with the student object
      expect(classroom).to receive(:student).and_return([student])
      student.classroom = classroom
      expect(student.classroom).to eq classroom
    end

    it 'does not add the student to the classroom if already present' do
      # Stub `student` method to return an array with the student object
      expect(classroom).to receive(:student).and_return([student])
      student.classroom = classroom
      expect(student.classroom).to eq classroom
    end
  end
end
