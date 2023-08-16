require_relative 'person'
require_relative 'classroom'
# Creates class Student (extends Person)
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
