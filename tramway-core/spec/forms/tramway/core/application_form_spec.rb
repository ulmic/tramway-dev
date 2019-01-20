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
end
