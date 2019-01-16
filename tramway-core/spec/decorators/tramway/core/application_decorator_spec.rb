require 'rails_helper'

RSpec.describe Tramway::Core::ApplicationDecorator do
  it 'defined decorator class' do
    expect(defined?(described_class)).to be_truthy
  end

  it 'should initialize new decorated object' do
    obj = 'it can be any object'
    expect{ described_class.new obj }.not_to raise_error(StandardError)
  end

  context 'Class check' do
    let(:class_methods) {
      described_class.methods -
      described_class.superclass.methods -
      bad_ass_monkey_patching_methods(source: :active_support) -
      bad_ass_monkey_patching_methods(source: [:action_view, :helpers])
    }

    it 'class should have only this methods list' do
      expect(class_methods.should =~ [:decorate_association, :list_attributes, :decorate]).to be_truthy
    end

    it 'returns list attributes' do
      expect(described_class.list_attributes).to eq []
    end

    it 'decorates simple object' do
      obj = 'it can be any object'
      expect(described_class.decorate(obj)).to be_a described_class
    end

    context 'with TestModel' do
      let(:models) { create_list(:test_model, 10) }

      it 'should have 10 items' do
        expect(described_class.decorate(models).count).to eq 10
      end
    end
  end
end
