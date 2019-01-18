require 'rails_helper'

RSpec.describe Tramway::Core::ApplicationForm do
  it 'defined form class' do
    expect(defined?(described_class)).to be_truthy
  end
end
