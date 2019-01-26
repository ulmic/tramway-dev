require 'rails_helper'

RSpec.describe Tramway::Core::ApplicationForm do
  it 'defined form class' do
    expect(defined?(described_class)).to be_truthy
  end

  it 'creates form object' do
    test_model = create :test_model
    test_model_form = Tramway::Core::ApplicationForm.new test_model
    expect(test_model_form).to be_a Tramway::Core::ApplicationForm
  end

  context 'Submit' do
#    it 'submit form with new object' do
#      test_model = create :test_model
#      test_model_form = Tramway::Core::ApplicationForm.new test_model
#      params = ActionController::Parameters.new test_model: { uid: 123, text: 'sometext' }
#      expect(test_model_form.submit(params[:test_model])).not_to raise_error
#    end

    it 'returns error if params is nil' do
      test_model = create :test_model
      test_model_form = Tramway::Core::ApplicationForm.new test_model
      params = ActionController::Parameters.new test_model: nil
      expect{ test_model_form.submit(params[:test_model]) }.to raise_error('Plugin: core; Method: title; Message: ApplicationForm::Params should not be nil')
    end
  end

  context 'Properties' do
    it 'set form_properties' do
      test_model = create :test_model
      test_model_form = Tramway::Core::ApplicationForm.new test_model
      test_model_form.form_properties text: :default, enumerized: :default
      expect(test_model_form.properties).to eq text: :default, enumerized: :default
    end
  end

  context 'Associations' do
    context 'with setted class_name' do
      it 'adds new association to form' do
        class_name = 'TestingAssociationWithSettedClassName'
        Object.const_set(class_name, Class.new(::Tramway::Core::ApplicationForm))
        class_name.constantize.associations :test_model
        association_model = create :association_model
        association_model_form = class_name.constantize.new association_model
        expect(association_model_form).to respond_to("test_model=").with(1).argument
      end
    end

    context 'without setted class_name' do
      it 'adds new association to form' do
        class_name = 'TestingAnother2AssociationWithSettedClassName'
        Object.const_set(class_name, Class.new(::Tramway::Core::ApplicationForm))
        class_name.constantize.associations :test_model
        association_model = create :another2_association_model
        association_model_form = class_name.constantize.new association_model
        expect(association_model_form).to respond_to("test_model=").with(1).argument
      end
    end
  end
end
