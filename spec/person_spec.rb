require 'spec_helper'
describe Person do
  before(:each) do
    @person = Person.new('20') 
  end

  describe '#new' do
    it 'takes three parameters with default value and returns a person object' do
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
end
