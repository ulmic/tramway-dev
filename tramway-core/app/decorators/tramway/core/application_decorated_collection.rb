class Tramway::Core::ApplicationDecoratedCollection < Array
  def initialize(array, original_array)
    @original_array = original_array
    super(array)
  end

  def original_array
    @original_array
  end

  delegate :total_pages, to: :original_array
  delegate :total_count, to: :original_array
  delegate :current_page, to: :original_array
  delegate :limit_value, to: :original_array
end
