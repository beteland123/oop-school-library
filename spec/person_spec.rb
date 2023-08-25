require 'spec_helper'
describe Person do
  before(:each) do
    @person = Person.new('20')
    @person2 = Person.new('17', name: 'Betty', parent_permission: false)
  end
  describe '#new' do
    it 'takes three parameters of which 2 default value and passed as argument and returns a person object' do
      @person.should be_an_instance_of Person
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      @person.age.should eql '20'
    end
  end
  describe '#name' do
    it 'returns the default name called unknown' do
      @person.name.should eql 'Unknown'
    end
  end
  describe '#parent_permission' do
    it 'returns the default parent_permission with value true' do
      actual = @person.parent_permission
      expect(actual).to be true
    end
  end

  describe '#new' do
    it 'takes three parameters and returns a person object' do
      @person2.should be_an_instance_of Person
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      @person2.age.should eql '17'
    end
  end
  describe '#name' do
    it 'should take the passed name as argmument' do
      @person2.name.should eql 'Betty'
    end
  end
  describe '#parent_permission' do
    it 'should take the passed parent_permission with value false' do
      actual = @person2.parent_permission
      expect(actual).to be false
    end
  end
  describe '#can_use_services?' do
    it 'returns false for peson2 if age is < 18 years or parent_persmmision is false' do
      @person2.age = @person2.age.to_i
      @person2.can_use_services?.should be_falsey
    end
    it 'returns true for peson if age is >=18 years or parent_persmmision is true' do
      @person.age = @person.age.to_i
      @person.can_use_services?.should be_truthy
    end
  end
  def test_add_rental
    rental_double = instance_double(Rental)
    allow(Rental).to receive(:new).and_return(rental_double)

    @person.add_rental(rental)

    assert_equal 1, @person.rentals.length
    assert_includes @person.rentals, rental

    # additional validation
    assert_equal rental.date, @person.rentals.first.date
  end
  describe '#of_ages?' do
    it 'returns true when age is 18 or older' do
      @person.age = @person.age.to_i
      expect(@person.send(:of_age?)).to be(true)
    end

    it 'returns false when age is under 18' do
      @person2.age = @person2.age.to_i
      expect(@person2.send(:of_age?)).to be(false)
    end
  end
  describe 'correct name' do
    it 'returns correct name' do
      expect(@person2.correct_name).to eq('Betty')
    end
  end
end
