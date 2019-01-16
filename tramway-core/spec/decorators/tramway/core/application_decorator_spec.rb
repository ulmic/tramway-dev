require 'spec_helper'

RSpec.describe Tramway::Core::ApplicationDecorator do
  it 'defined decorator class' do
    expect(defined?(described_class)).to be_truthy
  end

  it 'should initialize new decorated object' do
    obj = 'it can be any object'
    expect{ described_class.new obj }.not_to raise_error(StandardError)
  end

  it 'class should have only this methods list' do
    methods = described_class.methods -
              described_class.superclass.methods -
              bad_ass_monkey_patching_methods(source: :active_support) -
              bad_ass_monkey_patching_methods(source: [:action_view, :helpers])
    expect(methods.should =~ [:decorate_association, :list_attributes, :decorate]).to be_truthy
  end

  it 'should have only this methods list' do
    
  end
end
