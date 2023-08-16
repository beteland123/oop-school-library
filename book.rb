require_relative 'rental'

class Book
  attr_reader :rental
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, person, self)
    @rental << rental
  end
end
