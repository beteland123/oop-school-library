# Create a class Rental
require_relative 'book'
require_relative 'person'
class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rental << self

    @book = book
    book.rental << self
  end
end
