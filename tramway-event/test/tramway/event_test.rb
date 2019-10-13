# frozen_string_literal: true

require 'test_helper'

class Tramway::Event::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Tramway::Event
  end
end
