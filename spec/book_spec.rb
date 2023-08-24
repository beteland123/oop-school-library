require 'spec_helper'
describe Book do
  before(:each) do
    @book = Book.new('Title', 'Author')
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end
  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Title'
    end
  end
  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'Author'
    end
  end
  def test_add_rental
    rental_double = instance_double(Rental)
    allow(Rental).to receive(:new).and_return(rental_double)

    @book.add_rental(rental)

    assert_equal 1, @book.rentals.length
    assert_includes @book.rentals, rental

    # additional validation
    assert_equal rental.date, @book.rentals.first.date
  end
end
