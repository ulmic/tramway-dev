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
end
