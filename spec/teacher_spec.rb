require 'spec_helper'

describe Teacher do
  context 'when initializing' do
    it 'sets the specialization attribute' do
      teacher = Teacher.new('Math', 35)
      expect(teacher.instance_variable_get(:@specialization)).to eq('Math')
    end

    it 'inherits age, name, and parent_permission from Person' do
      teacher = Teacher.new('Math', 35, name: 'Ms. Smith', parent_permission: true)
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('Ms. Smith')
      expect(teacher.parent_permission).to be(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new('Science', 42)
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
