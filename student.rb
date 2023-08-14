require "./person.rb"

class Student <  Person
    def initialize (classroom, age, name = "Unknown", parent_permission = true)
        super(age, name,  parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
  
end

student = Student.new(  'c1',32, 'Helen')
puts student.play_hooky