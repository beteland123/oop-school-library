require 'spec_helper'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'creates a teacher object with specialization, age, name, and parent permission' do
      teacher = Teacher.new('Math', 40, name: 'John Doe', parent_permission: true)
      expect(teacher.instance_variable_get(:@specialization)).to eq 'Math'
      expect(teacher.age).to eq 40
      expect(teacher.name).to eq 'John Doe'
      expect(teacher.parent_permission).to eq true
    end
  end

  describe '#can_use_services?' do
    it 'returns true indicating the teacher can use services' do
      teacher = Teacher.new('History', 45)
      expect(teacher.can_use_services?).to eq true
    end
  end
end
