require_relative 'person'

# Creates class Teacher (extends Person)
class Teacher < Person
  def initialize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name:name, parent_permission:parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
