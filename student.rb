require_relative 'person'

# Creates class Student (extends Person)
class Student < Person
  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
student = Student.new(16, 'Math Class', name: 'Alice', parent_permission: true)
puts student.play_hooky
