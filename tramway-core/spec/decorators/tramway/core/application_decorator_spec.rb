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
      it 'should have 10 items' do
        create_list :test_model, 10
        models = TestModel.limit(10)
        expect(described_class.decorate(models).count).to eq 10
      end

      it 'should decorate all items' do
        create_list :test_model, 10
        models = TestModel.limit(10)
        expect(described_class.decorate(models)).to all be_a(described_class)
      end

      it 'should decorate association models' do
        test_model = create :test_model
        create_list :association_model, 10, test_model_id: test_model.id
        decorated_test_model = TestModelDecorator.decorate test_model
        expect(decorated_test_model.association_models).to all be_a(AssociationModelDecorator)
      end

      it 'should raise error about specify class_name of association' do
        test_model = create :test_model
        create_list :another_association_model, 10, test_model_id: test_model.id
        decorated_test_model = TestModelDecorator.decorate test_model
        expect{ decorated_test_model.another_association_models }.to raise_error("Plugin: core; Method: decorate_association; Message: Please, specify `another_association_models` association class_name in TestModel model. For example: `has_many :another_association_models, class_name: 'AnotherAssociationModel'`") 
      end
    end

  end

  context 'Delegation checks' do
    context 'with TestModel' do
      let(:test_model) { create :test_model }

      it 'delegates ID to object' do
        decorated_test_model = described_class.decorate test_model
        expect(decorated_test_model.id).to eq test_model.id
      end

      it 'delegates class to object' do
        decorated_test_model = described_class.decorate test_model
        expect(decorated_test_model.class).to eq test_model.class
      end

      it 'delegates human_state_name to object' do
        decorated_test_model = described_class.decorate test_model
        expect(decorated_test_model.human_state_name).to eq test_model.human_state_name
      end
    end
  end
end
