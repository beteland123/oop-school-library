require 'spec_helper'
describe CapitalizeDecorator do
  let(:base_decorator) { instance_double('BaseDecorator') }

  context 'when decorating a Decorator object' do
    it 'correctly capitalizes and trim up to 10 chrs of the name' do
      allow(base_decorator).to receive(:correct_name).and_return('christopher')
      decorator = TrimmerDecorator.new(base_decorator)
      expect(decorator.correct_name).to eq('CHRISTOPHE')
    end
  end
end
