require 'rails_helper'
require 'kaminari'

RSpec.describe Tramway::Core::ApplicationDecoratedCollection do
  it 'defined decorator class' do
    expect(defined?(described_class)).to be_truthy
  end

  it 'should initialize new decorated array' do
    create_list(:test_model, 20)
    test_models = TestModel.all.page(5)
    decorated_test_models = test_models.map { |t| Tramway::Core::ApplicationDecorator.new t }
    expect{ described_class.new decorated_test_models, test_models }.not_to raise_error(StandardError)
  end
end
