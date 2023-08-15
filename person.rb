class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end

person = Person.new(15, name: 'John', parent_permission: false)
puts person.can_use_services?

person2 = Person.new(48, name: 'selam')
puts person2.can_use_services?
