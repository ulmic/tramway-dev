class Tramway::Error < Exception
  def initialize(plugin: nil, method: nil, message: nil)
    @properties ||= {}
    @properties[:plugin] = plugin
    @properties[:method] = method
    @properties[:message] = message
  end

  def message
    "Plugin: #{@properties[:plugin]}; Method: #{@properties[:method]}; Message: #{@properties[:message]}"
  end

  def properties
    @properties ||= {}
  end
end
