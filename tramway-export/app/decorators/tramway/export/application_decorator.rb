# frozen_string_literal: true

class Tramway::Export::ApplicationDecorator
  def initialize(object)
    @object = object
  end

  class << self
    include Tramway::Core::Delegating::ClassHelper

    def columns
      []
    end

    def filename
      'export.xlsx'
    end

    def decorate(array)
      array.map do |obj|
        new obj
      end
    end
  end

  private

  attr_reader :object
end
