class Tramway::Export::ApplicationDecorator
  def initialize(object)
    @object = object
  end

  class << self
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

  def object
    @object
  end
end
