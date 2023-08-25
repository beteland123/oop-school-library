require 'spec_helper'
describe CapitalizeDecorator do
  let(:base_decorator) { instance_double('BaseDecorator') }

  context 'when decorating a Decorator object' do
    it 'correctly capitalizes the name' do
      allow(base_decorator).to receive(:correct_name).and_return('decorated name')
      decorator = CapitalizeDecorator.new(base_decorator)
      expect(decorator.correct_name).to eq('DECORATED NAME')
    end
  end
end
