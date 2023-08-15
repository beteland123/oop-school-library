require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'name'
require_relative 'decorator'

person = Person.new(15, name: 'John', parent_permission: false)
puts "person with out persmision can use services  #{person.can_use_services?}"

person2 = Person.new(48, name: 'selam')
puts "person with default persmision can use services  #{person2.can_use_services?}"

student = Student.new(16, 'Math Class', name: 'Alice', parent_permission: true)
puts student.play_hooky

teacher = Teacher.new('computer science', 30, name: 'Mike', parent_permission: false)
puts "Teacher with out persmision can use services  #{teacher.can_use_services?}"

person = Person.new(22, name: 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
