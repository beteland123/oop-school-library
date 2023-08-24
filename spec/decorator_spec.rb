require 'spec_helper'
describe Decorator do
  before(:each) do
    @decorator = Decorator.new('christopher')
  end

  describe '#new' do
    it 'takes one parameters and returns a @decorator object' do
      @decorator.should be_an_instance_of Decorator
    end
  end
  describe '#nameable' do
    it 'returns the correct pesron name' do
      @decorator.instance_variable_get(:@nameable).should eql 'christopher'
    end
  end
end
