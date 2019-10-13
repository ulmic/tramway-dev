# frozen_string_literal: true

require 'test_helper'

class Tramway::Export::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Tramway::Export
  end
end
