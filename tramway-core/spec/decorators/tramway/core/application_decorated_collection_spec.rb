require 'rails_helper'

RSpec.describe Tramway::Core::ApplicationDecoratedCollection do
  it 'defined decorator class' do
    expect(defined?(described_class)).to be_truthy
  end

#  it 'should initialize new decorated array' do
#    arr = (1..10).to_a.map do |index|
#     "it can be any object #{index} times"
#    end
#    expect{ described_class.new arr }.not_to raise_error(StandardError)
#  end
end
