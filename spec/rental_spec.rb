require 'rspec'
require_relative '../rental'

RSpec.describe Rental do
  let(:date) { '2023-08-25' }
  let(:person) { instance_double(Person, rental: []) }
  let(:book) { instance_double(Book, rental: []) }

  subject(:rental) { Rental.new(date, person, book) }

  describe '#initialize' do
    it 'sets the date, person, and book' do
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the person and book' do
      expect(person.rental).to include(rental)
      expect(book.rental).to include(rental)
    end
  end
end
