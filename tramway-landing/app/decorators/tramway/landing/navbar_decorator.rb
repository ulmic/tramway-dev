# frozen_string_literal: true

class Tramway::Landing::NavbarDecorator < ::Tramway::Core::ApplicationDecoratedCollection
  def initialize(array)
    original = if array.any? { |obj| obj.is_a? Hash }
                 get_original_array array
               else
                 array
               end
    super array, original
  end

  def original_array
    get_original_array @original_array
  end

  def dropdown_title
    object.keys.first
  end

  private

  def get_original_array(arr)
    arr.reduce([]) do |array, obj|
      if obj.is_a? Hash
        array += obj.values.first.original_array
      else
        array << obj
      end
    end
  end
end
