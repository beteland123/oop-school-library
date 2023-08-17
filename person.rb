require_relative 'name'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :name, :age, :type

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    @type = ''
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    rental = Rental.new(date, self, book)
    @rental << rental
  end
end
