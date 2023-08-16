require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'name'
require_relative 'decorator'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'

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

puts "======================================"
IOT = Classroom.new('IOT')
student = Student.new(19, IOT, name: 'John')
IOT.add_student(student)
student2 = Student.new(25, IOT, name: 'Nahom')
IOT.add_student(student2)
IOT.student.map do |s|
  puts "students in IOT classrom : => #{s.name}"
end

person1 = Person.new(25, name: 'Hilina')
person2 = Person.new(30, name: 'Leykun')
b1 = Book.new('The Internet of Things', 'Samuel Greengard')
b2 = Book.new('Getting Started with the Internet of Things', 'Cuno Pfister')
b3 = Book.new('Build Your Own Internet of Things Devices', 'Simon Monk ')
b4 = Book.new('Internet of Things Projects with Raspberry Pi ', 'Simon Monk')
b5 = Book.new('Internet of Things with JavaScript ', 'Nate Murray')

Rental.new('2017-12-22', person1, b1)
Rental.new('2017-12-31', person2, b2)
Rental.new('2017-11-11', person1, b3)
Rental.new('2017-10-10', person1, b4)
Rental.new('2017-10-10', person2, b5)

b1.rental.map(&:date)
puts "total rented book by person2: => #{person2.rental.count}"
puts "List books title rented by person1 #{person1.rental.map { |rental| rental.book.title }}"

puts "============================"
