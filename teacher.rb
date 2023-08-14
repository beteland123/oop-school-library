require "./person.rb"
class Teacher < Person
    def initialize (specialization, age, name = "Unknown", parent_permission = true)
        super(age, name, parent_permission)
        @specialization = specialization
    end
    def can_use_services
         true
    end
end

teacher = Teacher.new(  'computer science',30, 'Mike',false)
puts teacher.can_use_services